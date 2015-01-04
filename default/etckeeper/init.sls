# -*- mode: yaml -*-
{% set pget = salt['pillar.get'] %}

  
{% if pget('etckeeper:install_etckeeper_packages', True): %}
etckeeper-packages:
  pkg.installed:
    - pkgs:
      - etckeeper

etckeeper-config-file:
  file.managed:
    - name: /etc/etckeeper/etckeeper.conf
    - source: salt://default/etckeeper/etckeeper.conf
    - template: mako
{% endif %}


