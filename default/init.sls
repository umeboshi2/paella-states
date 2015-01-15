# -*- mode: yaml -*-
{% set pget = salt['pillar.get'] %}

include:
  - default.base
  - default.etckeeper
  - default.sysdefaults
  - default.timezone
  - default.adduser
  - default.dhclient
  - default.pager
  - default.editor
  - default.pkgsets
  - default.skeleton
  - default.xxdiff


message-of-the-day:
  file.managed:
    - name: /etc/motd
    - source: salt://default/files/motd
      
