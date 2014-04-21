# -*- mode: yaml -*-

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

host-paella:
  host.present:
    - ip: ${pillar['paella_server_ip']}
    - names:
      - paella
