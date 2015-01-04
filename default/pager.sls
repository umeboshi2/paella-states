# -*- mode: yaml -*-

pager:
  pkg.installed:
    - name: most
  alternatives.set:
    - name: pager
    - path: /usr/bin/most

most-system-config-file:
  file.managed:
    - name: /etc/most.conf
    - source: salt://default/files/most.conf
    - template: mako
    - require:
        - pkg: pager
          
