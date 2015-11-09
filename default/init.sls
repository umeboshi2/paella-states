# -*- mode: yaml -*-
{% set pget = salt['pillar.get'] %}

include:
  # base is empty
  - default.base
  # install_etckeeper_packages defaults to False
  - default.etckeeper
  # handles files in /etd/defaults/
  # seems to provide good defaults
  - default.sysdefaults
  # system:timezone defaults to False
  - default.timezone
  # installs adduser package and uses
  # debian defaults
  - default.adduser
  # dhclient uses defaults
  - default.dhclient
  # installs most and configures it to be system pager
  # I use this everywhere
  - default.pager
  # installs emacs
  # I use this everywhere
  - default.editor
  # default packages, nothing installed by default
  # getting rid of these in favor of managed-packages, which
  # allows to combine into one install
  # FIXME - remove this after assured nothing requires it
  - default.pkgsets
  # creates skeleton for new users (mostly harmless)
  - default.skeleton
  # will build xxdiff if needed, disabled by default
  # not needed anymore - qt4 xxdiff in debian main
  - default.xxdiff


message-of-the-day:
  file.managed:
    - name: /etc/motd
    - source: salt://default/files/motd
      
