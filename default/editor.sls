# -*- mode: yaml -*-
{% set pget = salt['pillar.get'] %}

emacs:
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
      - pkg: emacs

# emacs-build-dependencies should be set to emacs23, emacs24, etc.
{% set emacs = pget('devpackages:emacs-build-dependencies', '') %}
{% if emacs: %}
emacs-builddeps:
  cmd.run:
    - name: apt-get -y build-dep {{ emacs }}
    - require:
      - pkg: emacs
{% endif %}


