# -*- mode: yaml -*-

apt-packages:
  pkg.installed:
    - pkgs:
      - aptitude
      - grep-dctrl

sources-list:
  file.managed:
    - name: /etc/apt/sources.list
    - requires: apt-packages
    - source: salt://apt/sources.list
    - template: mako
