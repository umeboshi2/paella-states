# -*- mode: yaml -*-

include:
  - services.bind.base

bind-local-zone-config-file:
  file.managed:
    - name: /etc/bind/named.conf.local
    - source: salt://services/bind/files/named.conf.local
    - template: mako
    - requires:
      - pkg: bind9
    - user: root
    - group: bind
      
bind-service:
  service.running:
    - name: bind9

# FIXME this is peculiar to paella      
{% for direction in ['paellanet', 'rev']: %}
bind-paella-zone-{{ direction }}-file:
  file.managed:
    - name: /etc/bind/db.{{ direction }}
    - source: salt://services/bind/files/db.{{ direction }}
    - template: mako
    - requires:
      - pkg: bind9
    - user: root
    - group: root
{% endfor %}
  
