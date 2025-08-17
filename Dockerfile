FROM postgres:16

# Copiamos el script de inicialización con el propietario correcto.
# Postgres ejecutará automáticamente cualquier *.sql en /docker-entrypoint-initdb.d
# la primera vez que se inicializa el volumen de datos.
# Mantener propiedad postgres evita problemas de permisos en algunos hosts.
COPY --chown=postgres:postgres setup_db.sql /docker-entrypoint-initdb.d/01-setup_db.sql