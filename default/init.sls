# -*- mode: yaml -*-
{% set pget = salt['pillar.get'] %}

include:
  - default.base
  - default.sysdefaults
  - default.timezone
  - default.pager
  - default.editor
  - default.pkgsets
  - default.ssh
  - default.xxdiff
  
