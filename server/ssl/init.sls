# -*- mode: yaml -*-

include:
  - default

ssl_server_packages:
  pkg.installed:
    - pkgs:
      - ssl-cert


#sshd_config:
#  file.managed:
#    - name: /etc/ssh/sshd_config
#    - source: salt://server/ssh/sshd_config
#    - mode: 640

