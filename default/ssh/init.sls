# -*- mode: yaml -*-

/etc/ssh/ssh_config:
  file.managed:
    - source: salt://default/ssh/files/ssh_config
    - template: jinja
