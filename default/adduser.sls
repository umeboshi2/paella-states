# -*- mode: yaml -*-
{% set pget = salt['pillar.get'] %}


adduser-pkg:
  pkg.installed:
    - name: adduser

adduser-config-file:
  file.managed:
    - name: /etc/adduser.conf
    - source: salt://default/files/adduser.conf
    - template: mako
    - require:
        - pkg: pager

{% set dhome = pget('adduser:dhome', '') %}
{% if dhome %}
dhome_directory:
  file.directory:
    - name: {{ dhome }}
{% endif %}
