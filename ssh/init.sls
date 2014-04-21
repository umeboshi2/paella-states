# -*- mode: yaml -*-

/etc/ssh/ssh_config:
  file.managed:
    - source: salt://ssh/ssh_config
    - template: mako
