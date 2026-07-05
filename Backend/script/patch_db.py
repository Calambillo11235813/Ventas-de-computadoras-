import os
import django

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'config.settings')
django.setup()

from django.db import connection

SQL = """
ALTER TABLE producto ADD COLUMN IF NOT EXISTS meses_garantia INTEGER DEFAULT 0;
ALTER TABLE cliente ADD COLUMN IF NOT EXISTS total_acumulado NUMERIC(12, 2) DEFAULT 0;
ALTER TABLE cliente ADD COLUMN IF NOT EXISTS descuento_disponible NUMERIC(10, 2) DEFAULT 0;

CREATE TABLE IF NOT EXISTS garantia (
    idgarantia SERIAL PRIMARY KEY,
    idventa INTEGER NOT NULL REFERENCES venta(idventa) ON DELETE CASCADE,
    iddetalle INTEGER NOT NULL UNIQUE REFERENCES detalleventa(iddetalle) ON DELETE CASCADE,
    idproducto INTEGER NOT NULL REFERENCES producto(idproducto),
    idcliente INTEGER REFERENCES cliente(idcliente),
    cantidad INTEGER DEFAULT 1,
    meses INTEGER DEFAULT 0,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    estado VARCHAR(20) DEFAULT 'activa',
    motivo_reclamo TEXT,
    fecha_reclamo TIMESTAMP,
    resolucion TEXT,
    fecha_resolucion TIMESTAMP
);

CREATE TABLE IF NOT EXISTS resena (
    idresena SERIAL PRIMARY KEY,
    idventa INTEGER NOT NULL UNIQUE REFERENCES venta(idventa) ON DELETE CASCADE,
    idcliente INTEGER NOT NULL REFERENCES cliente(idcliente) ON DELETE CASCADE,
    puntuacion SMALLINT NOT NULL,
    comentario TEXT,
    estado VARCHAR(20) DEFAULT 'visible',
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
"""

with connection.cursor() as cursor:
    cursor.execute(SQL)
    print("Database patched successfully!")
