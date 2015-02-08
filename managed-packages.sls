# -*- mode: yaml -*-
{% set pget = salt['pillar.get'] %}
{% from 'named-toolsets.jinja' import named_toolset_definitions %}
{#
{% set definitions = pget('named-toolset-definitions', {}) %}
#}
{% set definitions = named_toolset_definitions %}
{% set toolsets = pget('system:toolsets', {}) %}
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
