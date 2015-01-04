# -*- mode: yaml -*-
{% set pget = salt['pillar.get'] %}

include:
  - default
  - services.dhcpd.base


isc-dhcp-server:
  service:
    - running
    - require:
        - pkg: isc-dhcp-server-package
        - file: /etc/dhcp/dhcpd.conf
        - file: /etc/default/isc-dhcp-server
    - watch:
        - file: /etc/dhcp/dhcpd.conf
        - file: /etc/default/isc-dhcp-server


