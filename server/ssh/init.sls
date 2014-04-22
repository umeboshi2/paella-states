# -*- mode: yaml -*-

include:
  - default
  
ssh_server_packages:
  pkg.installed:
    - pkgs:
      - openssh-server

sshd_config:
  file.managed:
    - name: /etc/ssh/sshd_config
    - source: salt://server/ssh/sshd_config
    - mode: 640

