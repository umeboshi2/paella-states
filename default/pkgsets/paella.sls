# -*- mode: yaml -*-
{% set pget = salt['pillar.get'] %}

include:
  - default.base
  


{% if pget('pkgsets:paella:basic-tools', False): %}
basic-tools:
  pkg.installed:
    - pkgs:
      - screen
      - iotop
      - htop
      - rsync
{% endif %}

{% if pget('pkgsets:paella:devpackages', False): %}
devpackages:
  pkg.installed:
    - pkgs:
      - git-core
      - devscripts
      - cdbs
      - pkg-config
      - rubygems
{% endif %}

{% if pget('pkgsets:paella:python-dev', False): %}
python-dev:
  pkg.installed:
    - pkgs:
      - python-dev
      - python-requests
      - virtualenvwrapper
      - python-stdeb
{% endif %}


{% if pget('pkgsets:paella:python-libdev', False): %}
python-libdev:
  pkg.installed:
    - pkgs:
      - libpq-dev 
      - libjpeg62-dev 
      - libpng12-dev 
      - libfreetype6-dev 
      - liblcms1-dev 
      - libxml2-dev 
      - libxslt1-dev 
{% endif %}


{% if pget('pkgsets:paella:misc-packages', False): %}
misc-packages:
  pkg.installed:
    - pkgs:
      - bible-kjv
      - ascii
      - fortune-mod
      - cowsay
{% endif %}

{% if pget('pkgsets:paella:deb-keyring-builddeps', False): %}
debian-archive-keyring-build-depends:
  pkg.installed:
    - pkgs:
      - jetring
{% endif %}

{% if pget('pkgsets:paella:wimlib-builddeps', False): %}
wimlib-build-depends:
  pkg.installed:
    - pkgs:
      - autoconf
      - automake
      - libtool
      - debhelper
      - autotools-dev
      - pkg-config
      - libfuse-dev
      - libxml2-dev
      - libssl-dev
      - ntfs-3g-dev
      - libattr1-dev
      - attr
# it looks like pbuilder may be
# required to effectively build
# wimlib for both i386 and amd64
wimlib-build-depends-extra:
  pkg.installed:
    - pkgs:
      - pbuilder
{% endif %}

{% if pget('pkgsets:paella:wimlib-deps', False): %}
wimlib-runtime-depends:
  pkg.installed:
    - pkgs:
      - genisoimage
      - cabextract
{% endif %}


{% if pget('pkgsets:paella:bootloader-packages', False): %}
bootloader-packages:
  pkg.installed:
    - pkgs:
      - syslinux
      - ipxe
{% endif %}
      
{% if pget('pkgsets:paella:installer-disktools', False): %}
installer-disktools:
  pkg.installed:
    - pkgs:
      - parted
      - xfsprogs
      - reiserfsprogs
      - btrfs-tools
      - e2fsprogs
      - mdadm
{% endif %}
      
  
{% if pget('pkgsets:paella:mingw-packages', False): %}
# These may not be necessary, but are here in case
# it's easier to build some of the salt-minion dependencies
# in debian.
mingw-packages:
  pkg.installed:
    - pkgs:
      - mingw-w64
      - mingw-w64-tools
{% endif %}

{% if pget('pkgsets:paella:live-system-dekstop-packages', False): %}
# A desktop is needed on the live system
# In order to more easily prepare the local
# partial debian repository, install the packages
# on the vagrant machine.  UPDATE:  Virtualbox is
# used to install the bootloader for mswindows
# on the hard disk from the live system after installing
# a wim image.
live-system-dekstop-packages:
  pkg.installed:
    - pkgs:
      - task-xfce-desktop
      
# FIXME: these are being installed on the paella server to be
# available in the local repository when building live
# images.
#
# Recreate the live package list, then comment this state out.
live-image-packages:
  pkg.installed:
    - pkgs:
      - iceweasel
      - libreoffice
      - xfprint4
      - epdfview
      - miscfiles
{% endif %}


{% if pget('pkgsets:paella:virtualbox', False): %}
# the virtualbox packages will be 
# needed for the live installer
virtualbox-packages:
  pkg.installed:
    - pkgs:
      - virtualbox
{% endif %}


{% if pget('pkgsets:paella:apache-wsgi-support', False): %}
apache-support-packages:
  pkg.installed:
    - pkgs:
      - libapache2-mod-wsgi
      - apache2-mpm-worker
      - apache2-utils

apache-package:
  pkg.installed:
    - name: apache2
    - requires:
      - pkg: apache-support-packages
{% endif %}

{% if pget('pkgsets:paella:bind', False): %}
bind9:
  pkg:
    - installed
{% endif %}
    
{% if pget('pkgsets:paella:live-builder', False): %}
live-build:
  pkg:
    - installed
{% endif %}
    
{% if pget('pkgsets:paella:debrepos', False): %}
reprepro:
  pkg:
    - installed

# use germinate to help build
# small partial debian repository
# capable of debootstrap
germinate:
  pkg:
    - installed
{% endif %}

{% if pget('pkgsets:paella:debrepos-support', False): %}
python-debrepos-support-packages:
  pkg.installed:
    - pkgs:
      - python-libtorrent
      - python-feedparser
{% endif %}

{% if pget('pkgsets:paella:postgresql', False): %}
postgresql-support-packages:
  pkg.installed:
    - pkgs:
      - postgresql-contrib


postgresql-package:
  pkg.installed:
    - name: postgresql
    - requires:
      - pkg: postgresql-support-packages
{% endif %}

#

{% if pget('pkgsets:paella:dhcpd', False): %}
isc-dhcp-server-package:
  pkg.installed:
    - name: isc-dhcp-server
{% endif %}

#

    
{% if pget('pkgsets:paella:shorewall', False): %}
shorewall-package:
  pkg.installed:
    - name: shorewall
{% endif %}

# netboot.base

{% if pget('pkgsets:paella:nfsd', False): %}
nfs-kernel-server-package:
  pkg.installed:
    - name: nfs-kernel-server
{% endif %}


{% if pget('pkgsets:paella:tftpd', False): %}
tftpd-package:
  pkg.installed:
    - name: tftpd-hpa
{% endif %}


#
{% if pget('pkgsets:paella:samba', False): %}
samba-support-packages:
  pkg.installed:
    - pkgs:
      - smbclient

samba-server-package:
  pkg.installed:
    - name: samba
    - requires:
      - pkg: samba-support-packages
{% endif %}


{% if pget('pkgsets:paella:schroot', False): %}
schroot-packages:
  pkg.installed:
    - pkgs:
      - schroot
{% endif %}



