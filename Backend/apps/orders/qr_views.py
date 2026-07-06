from django.conf import settings
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from django.db import transaction

from .models import MetodoPago
from .serializers import VentaSerializer, VentaCreateSerializer

class QRBancoInfoView(APIView):
    """Devuelve la configuración del QR Bancario para mostrar al cliente."""
    def get(self, request):
        return Response({
            'qr_imagen': getattr(settings, 'QR_BANCO_IMAGEN_URL', '/media/YAPE_QR.jpg'),
            'titular': getattr(settings, 'QR_BANCO_NOMBRE', 'Santa Cruz Computer SRL'),
            'cuenta': getattr(settings, 'QR_BANCO_CUENTA', 'Yape/Transferencia'),
        })

class QRPedidoView(APIView):
    """Crea una venta online pagada con QR (Transferencia)."""
    def post(self, request):
        import json
        
        # Si viene en FormData (multipart), detalles puede ser un string JSON
        cliente_id = request.data.get('cliente')
        detalles_raw = request.data.get('detalles', [])
        monto = request.data.get('monto')
        aplicar_descuento_vip_raw = request.data.get('aplicar_descuento_vip', True)

        try:
            if isinstance(detalles_raw, str):
                detalles = json.loads(detalles_raw)
            else:
                detalles = detalles_raw
        except ValueError:
            return Response({"detail": "Formato inválido de detalles."}, status=status.HTTP_400_BAD_REQUEST)

        if str(aplicar_descuento_vip_raw).lower() in ['false', '0']:
            aplicar_descuento_vip = False
        else:
            aplicar_descuento_vip = bool(aplicar_descuento_vip_raw)

        if not cliente_id or not detalles:
            return Response({"detail": "Faltan datos del cliente o productos."}, status=status.HTTP_400_BAD_REQUEST)

        # Como este es un pedido online hecho por el cliente desde la tienda,
        # NO hay ningún empleado ('usuario') que esté registrando la venta.
        usuario_id = None

        serializer = VentaCreateSerializer(data={
            'cliente': cliente_id,
            'usuario': usuario_id,
            'pedido_online': True,
            'aplicar_descuento_vip': aplicar_descuento_vip,
            'detalles': detalles,
            'pagos': [{
                'monto': monto,
                'metodo': MetodoPago.TRANSFERENCIA
            }]
        })

        if serializer.is_valid():
            venta = serializer.save()
            
            # Guardar el comprobante si fue enviado
            if 'comprobante' in request.FILES:
                venta.comprobante_url = request.FILES['comprobante']
                venta.save(update_fields=['comprobante_url'])
            
            # Devolver la venta creada serializada para lectura
            read_serializer = VentaSerializer(venta)
            return Response(read_serializer.data, status=status.HTTP_201_CREATED)
        
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
