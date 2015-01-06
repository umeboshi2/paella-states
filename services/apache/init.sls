# -*- mode: yaml -*-

include:
  - default.pkgsets
  - services.apache.base

apache-service:
  service.running:
    - name: apache2
    - require:
      - pkg: apache-package
