# -*- mode: yaml -*-

include:
  - default
  - services.apache.base

apache-service:
  service.running:
    - name: apache2
    - require:
      - pkg: apache-package
