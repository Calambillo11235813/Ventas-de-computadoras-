import os
import django
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'config.settings')
django.setup()

from apps.products.models import Producto, Compra
from apps.users.models import Cliente
from apps.orders.models import Garantia, Resena

models = [Producto, Cliente, Garantia, Resena, Compra]
for m in models:
    try:
        list(m.objects.all()[:1])
    except Exception as e:
        print(f"ERROR in {m.__name__}: {e}")
