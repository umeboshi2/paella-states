# -*- mode: yaml -*-
{% set pget = salt['pillar.get'] %}

include:
  - default.base
  - default.pkgsets.paella
  - default.pkgsets.standard
