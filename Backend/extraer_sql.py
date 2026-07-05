import re

md_path = r"d:\2.FAMILIA\NICOLAS\proyecto\santa-cruz-computer\Docs\Basededatos\base_de_datos_completa.md"
sql_path = r"d:\2.FAMILIA\NICOLAS\proyecto\santa-cruz-computer\Backend\restaurar_db.sql"

print("Extrayendo código SQL del archivo Markdown...")

with open(md_path, 'r', encoding='utf-8') as f:
    content = f.read()

# Buscar todos los bloques de código SQL (```sql ... ```)
sql_blocks = re.findall(r'```sql\n(.*?)```', content, re.DOTALL)

with open(sql_path, 'w', encoding='utf-8') as f:
    for block in sql_blocks:
        f.write(block)
        f.write('\n\n')

print("¡Listo! Se ha creado el archivo 'restaurar_db.sql' en la carpeta Backend.")
