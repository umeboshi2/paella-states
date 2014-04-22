# -*- mode: yaml -*-

include:
  - default
  - server.ssl
  - server.ssh

base_server_packages:
  pkg.installed:
    - pkgs:
      - openssh-server
      %if pillar['server']['install_tinyca']:
      - tinyca
      %endif

