# -*- mode: yaml -*-
{% set pget = salt['pillar.get'] %}
{% from 'named-toolsets.jinja' import named_toolset_definitions %}
{% set definitions = named_toolset_definitions %}
{% set toolsets = pget('system:toolsets', {}) %}

{# test combining toolsets #}
{% if pget('system:toolsets_combined', False) %}
{% set packagelist = [] %}
{% for toolset in toolsets %}
{% do packagelist.extend(definitions[toolset]) %}
{% endfor %}
main-combined-toolsets:
  pkg.installed:
    - pkgs:
      {% for package in packagelist %}
      - {{ package }}
      {% endfor %}
{% endif %}


{% for toolset in toolsets -%}
  {# we do access without dict.get to fail if toolset isn't defined #}
  {% set packagelist = definitions[toolset] %}
  toolset-{{ toolset }}:
    pkg.installed:
      - pkgs:
        {% for package in packagelist %}
        - {{ package }}
        {% endfor %}
{% endfor %}
