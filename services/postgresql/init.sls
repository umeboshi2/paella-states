# -*- mode: yaml -*-
{% set pget = salt['pillar.get'] %}

include:
  - services.postgresql.base

# FIXME
# We really need to make a password for the dbadmin user
# and fix the pg_hba.conf file as well.
/etc/postgresql/9.1/main/pg_hba.conf:
  file.managed:
    - source: salt://services/postgresql/files/pg_hba.conf
    - user: postgres
    - group: postgres
    - mode: 640

# FIXME      
# For debug and development purposes, the
# paella server is accepting db connections
# on the second network interface.  This should
# not be done in production.
/etc/postgresql/9.1/main/postgresql.conf:
  file.managed:
    - source: salt://services/postgresql/files/postgresql.conf
    - user: postgres
    - group: postgres
    - mode: 644
    - template: mako

      
postgresql-service:
  service.running:
    - name: postgresql
    - requires:
      - pkg: postgresql-package
    - watch:
      - file: /etc/postgresql/9.1/main/pg_hba.conf
      - file: /etc/postgresql/9.1/main/postgresql.conf

{% if pget('paella:make-paella-database', False): %}        
paella_database_user:
  postgres_user.present:
    - name: dbadmin
    - createdb: true
    - createruser: true
    - superuser: true
    - user: postgres
      
paella_database:
  postgres_database.present:
    - name: paella
    - owner: dbadmin
    - user: postgres
{% endif %}