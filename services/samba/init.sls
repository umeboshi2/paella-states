# -*- mode: yaml -*-
{% set pget = salt['pillar.get'] %}

include:
  - services.samba.base

shares_directory:
  file.directory: 
    - name: {{ pget('samba:shares_directory', '/srv/shares') }}


smb.conf:
  file.managed:
    - name: /etc/samba/smb.conf
    - source: salt://services/samba/files/smb.conf
    - template: mako
    - requires:
      - pkg: samba-server-package

samba-server-service:
  service:
    - name: samba
    - running
    - watch:
      - file: smb.conf
