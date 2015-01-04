# -*- mode: yaml -*-
{% set pget = salt['pillar.get'] %}

pager:
  pkg.installed:
    - name: most
  alternatives.set:
    - name: pager
    - path: /usr/bin/most

emacs-packages:
  pkg.installed:
    - pkgs:
      - emacs
      - mmm-mode
      - emacs-goodies-el

local-editor:
  file.managed:
    - name: /usr/local/bin/editor
    - source: salt://default/files/local-editor.sh
    - mode: 755
    - require:
      - pkg: emacs-packages


