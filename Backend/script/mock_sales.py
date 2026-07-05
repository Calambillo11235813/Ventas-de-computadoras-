import os
import random
import django

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'config.settings')
django.setup()

from apps.products.models import Producto
from apps.users.models import Cliente, Usuario
from apps.orders.models import Venta, DetalleVenta, EstadoVenta, EstadoEntrega
from django.utils import timezone
from datetime import timedelta

print("Buscando clientes y usuarios...")
cliente = Cliente.objects.first()
usuario = Usuario.objects.first()
productos = list(Producto.objects.all()[:5])

if not cliente or not usuario or not productos:
    print("Faltan clientes, usuarios o productos para generar ventas.")
    exit()

print("Generando ventas falsas...")
for i in range(5):
    # Fechas aleatorias en los ultimos 60 dias
    fecha = timezone.now() - timedelta(days=random.randint(1, 60))
    
    v = Venta.objects.create(
        cliente=cliente,
        usuario=usuario,
        estado=EstadoVenta.COMPLETED,
        estado_entrega=EstadoEntrega.ENTREGADO
    )
    # Sobrescribir fecha (auto_now_add no deja hacerlo en create directo sin hack)
    Venta.objects.filter(id=v.id).update(fecha_venta=fecha)
    
    # Agregar 1-3 detalles
    monto_total = 0
    for _ in range(random.randint(1, 3)):
        p = random.choice(productos)
        cant = random.randint(1, 2)
        precio = p.precio_actual
        monto_total += cant * precio
        
        DetalleVenta.objects.create(
            venta=v,
            producto=p,
            cantidad=cant,
            precio_unitario=precio
        )
    
    # El trigger de postgresql debería actualizar el monto_total de la Venta al insertar el detalle.

print(f"Se generaron ventas falsas exitosamente. Total ventas ahora: {Venta.objects.count()}")

