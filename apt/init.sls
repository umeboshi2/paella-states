# -*- mode: yaml -*-

apt-packages:
  pkg.installed:
    - pkgs:
      - aptitude
      - grep-dctrl

%if 'paella_server_ip' in pillar:
host-paella:
  host.present:
    - ip: ${pillar['paella_server_ip']}
    - names:
      - paella
%endif

sources-list:
  file.managed:
    - name: /etc/apt/sources.list
    - requires: apt-packages
    - source: salt://apt/sources.list
    - template: mako

update-apt:
  cmd.run:
    - name: apt-get -y update
    - watch:
      - file: sources-list
    %if 'paella_server_ip' in pillar:
    - require:
      - host: host-paella
    %endif