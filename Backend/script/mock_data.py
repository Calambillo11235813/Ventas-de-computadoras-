import os
import random
import django

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'config.settings')
django.setup()

from apps.products.models import Producto
from apps.orders.models import Venta, DetalleVenta, Garantia, Resena, EstadoVenta, EstadoGarantia, EstadoResena
from apps.users.models import Cliente
from django.utils import timezone
from datetime import timedelta

print("Actualizando meses_garantia en Productos...")
Producto.objects.update(meses_garantia=12)

print("Generando Garantias retroactivas para las ventas existentes...")
ventas = Venta.objects.all()
for venta in ventas:
    # Solo ventas con cliente para la reseña y garantias (aunque garantias pueden no tener cliente, mejor que si)
    detalles = venta.detalles.all()
    for detalle in detalles:
        # Check if garantia already exists
        if not hasattr(detalle, 'garantia'):
            fecha_inicio = venta.fecha_venta.date()
            fecha_fin = fecha_inicio + timedelta(days=365) # 12 months approx
            
            estado_gar = EstadoGarantia.ACTIVA
            # Hacer que algunas estén reclamadas al azar para que se vea en el dashboard
            if random.random() < 0.2:
                estado_gar = EstadoGarantia.RECLAMADA
            
            Garantia.objects.create(
                venta=venta,
                detalle=detalle,
                producto=detalle.producto,
                cliente=venta.cliente,
                cantidad=detalle.cantidad,
                meses=12,
                fecha_inicio=fecha_inicio,
                fecha_fin=fecha_fin,
                estado=estado_gar,
                motivo_reclamo="Falla reportada por el cliente" if estado_gar == EstadoGarantia.RECLAMADA else None,
                fecha_reclamo=timezone.now() if estado_gar == EstadoGarantia.RECLAMADA else None
            )

print("Generando Reseñas para las ventas completadas...")
comentarios = ["Excelente servicio", "Muy buen producto, recomendado", "Todo llegó a tiempo", "Mejorable, pero bien", "Me encantó la atención"]
for venta in ventas.filter(estado=EstadoVenta.COMPLETED).exclude(cliente__isnull=True):
    if not hasattr(venta, 'resena'):
        Resena.objects.create(
            venta=venta,
            cliente=venta.cliente,
            puntuacion=random.randint(3, 5),
            comentario=random.choice(comentarios),
            estado=EstadoResena.VISIBLE
        )

print("Mock data de garantías y reseñas generada con éxito!")
