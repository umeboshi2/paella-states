# -*- mode: yaml -*-
{% set cfiles = ['console-setup', 'hwclock', 'keyboard', 'locale', 'nfs-common',
    'nss', 'ntp', 'rsyslog', 'tmpfs'] %}
{% for configfile in cfiles: %}
etc-default-config-{{ configfile }}:
  file.managed:
    - name: /etc/default/{{ configfile }}
    - source: salt://default/sysdefaults/{{ configfile }}-default-config
    - template: mako
{% endfor %}

