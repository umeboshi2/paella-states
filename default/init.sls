# -*- mode: yaml -*-

include:
  - apt


pager:
  pkg.installed:
    - name: most
  alternatives.set:
    - name: pager
    - path: /usr/bin/most

emacs:
  pkg.installed:
    - name: emacs23

screen:
  pkg:
    - installed

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
      
      