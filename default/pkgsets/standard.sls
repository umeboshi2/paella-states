# -*- mode: yaml -*-
{% set pget = salt['pillar.get'] %}

#FIXME rearrange all of this

include:
  - default.base
  
{% if pget('pkgsets:base_admin_tools', False): %}
base-admin-tools:
  pkg.installed:
    - pkgs:
      - acl
      - attr 
      - bash-completion 
      - bsdtar 
      - bzip2 
      - cabextract 
      - fdupes 
      - gawk
      - hardlink
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
      - sysv-rc-conf
{% endif %}


{% if pget('pkgsets:debian_admin_tools', False): %}
debian_admin_tools:
  pkg.installed:
    - pkgs:
      - apt-listchanges
      - dctrl-tools
      - debconf-utils
      - debian-goodies
      - reportbug
{% endif %}

{% if pget('pkgsets:acpi_packages', False): %}
acpi_packages:
  pkg.installed:
    - pkgs:
      - acpid
      - acpi-support-base
      - acpitool
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

  
{% if pget('pkgsets:base_hardware', False): %}
base-hardware:
  pkg.installed:
    - pkgs:
      - dmidecode
      - hddtemp
      - lm-sensors
      - sdparm
      - usbutils
{% endif %}



{% if pget('pkgsets:base_firmware', False): %}
{% set extra = pget('pkgsets:extra_firmware_packages', []) %}
firmware-packages:
  pkg.installed:
    - requires:
      - pkg: base-hardware
    - pkgs:
      - firmware-linux
      - firmware-linux-nonfree
      {% for pkg in extra: %}
      - {{ pkg }}
      {% endfor %}
{% endif %}

{% if pget('pkgsets:laptop', False): %}
laptop-hardware:
  pkg.installed:
    - requires:
      - pkg: base-hardware
    - pkgs:
      - hibernate
      - fancontrol
      - task-laptop
{% endif %}

