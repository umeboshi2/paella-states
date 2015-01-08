# -*- mode: yaml -*-
{% set pget = salt['pillar.get'] %}
{% if pget('system:timezone', False): %}
local_timezone:
  timezone.system:
    - name: pget('system:timezone')
    - utc: {{ pget('system:hwclock_utc', True): }}
{% endif %}
