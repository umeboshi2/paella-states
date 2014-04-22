# -*- mode: yaml -*-

include:
  - apt

/etc/skel/.dircolors:
  file.managed:
    - source: salt://default/dircolors

pager:
  pkg.installed:
    - name: most
  alternatives.set:
    - name: pager
    - path: /usr/bin/most

emacs:
  pkg.installed:
    - pkgs:
      - emacs23
      - mmm-mode
      - emacs-goodies-el

local-editor:
  file.managed:
    - name: /usr/local/bin/editor
    - source: salt://default/local-editor.sh
    - mode: 755
    - require:
      - pkg: emacs

screen:
  pkg:
    - installed
%if pillar['packages']['base_admin_tools']:
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
%endif


%if pillar['packages']['debian_admin_tools']:
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
%endif

%if pillar['packages']['acpi_packages']:
acpi_packages:
  pkg.installed:
    - pkgs:
      - acpid
      - acpi-support-base
%endif
  

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


