# submodules/eco-shop-db/Dockerfile
FROM postgres:16

# Copiamos el script de inicialización.
# Postgres ejecutará automáticamente cualquier *.sql en este directorio
# la primera vez que se inicializa el volumen de datos.
COPY setup_db.sql /docker-entrypoint-initdb.d/01-setup_db.sql
