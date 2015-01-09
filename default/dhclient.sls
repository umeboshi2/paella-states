# -*- mode: yaml -*-
{% set pget = salt['pillar.get'] %}


dhclient-config-file:
  file.managed:
    - name: /etc/dhcp/dhclient.conf
    - source: salt://default/files/dhclient.conf
    - template: jinja
