# -*- mode: yaml -*-
{% set pget = salt['pillar.get'] %}

include:
  - default.base
  
{% if pget('pkgsets:base_admin_tools', False): %}
base-admin-tools:
  pkg.installed:
    - pkgs:
      - acl 
      - atop 
      - attr 
      - bash-completion 
      - bsdtar 
      - bzip2 
      - cabextract 
      - fdupes 
      - gawk 
      - htop 
      - iotop 
      - keychain 
      - logcheck 
      - lrzsz 
      - lsof 
      - ltrace 
      - members 
      - minicom 
      - most 
      - openssh-client 
      - p7zip-full 
      - pbzip2 
      - pigz 
      - rsync 
      - screen 
      - slay 
      - strace
{% endif %}


{% if pget('pkgsets:debian_admin_tools', True): %}
debian_admin_tools:
  pkg.installed:
    - pkgs:
      - apt-listchanges
      - dctrl-tools
      - debconf-utils
      - debian-goodies
      - dselect
      - rcconf
      - reportbug
{% endif %}

{% if pget('pkgsets:acpi_packages', False): %}
acpi_packages:
  pkg.installed:
    - pkgs:
      - acpid
      - acpi-support-base
{% endif %}

{% if pget('pkgsets:default_packages', False): %}
default-packages:
  pkg.installed:
    - pkgs:
      - bible-kjv
      - bible-kjv-text
      - fortunes
      - gnupg-agent
      - ntp
      - pinentry-curses
      - etckeeper
      # FIXME
      - pgpdump
{% endif %}
