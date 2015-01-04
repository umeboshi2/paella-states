# -*- mode: yaml -*-
{% set pget = salt['pillar.get'] %}

/etc/skel/.dircolors:
  file.managed:
    - source: salt://default/skeleton/dircolors

/etc/skel/.bashrc:
  file.managed:
    - source: salt://default/skeleton/bashrc

{% for dirname in ['bin', 'tmp', 'workspace', '.hp48']: %}
/etc/skel/{{ dirname }}:
  file.directory
{% endfor %}

{% if pget('pkgsets:x48-packages', False): %}
# this is for x48
# there isn't system config for x48, nor system wide place
# to leave rom.
# FIXME, make this symlink to system rom instead of home
gxrom-r-archive:
  file.managed:
    - name: /usr/local/share/x48/gxrom-r.bz2
    - source: http://downloads.sourceforge.net/project/x48.berlios/gxrom-r.bz2
    - source_hash: sha256=f89eb7bf979e62db53d436e3218b963c693f66c52797218c01d6552f1bbe014f
    - makedirs: True
      
create-skel-gxrom:
  cmd.run:
    - unless: test -r /etc/skel/.hp48/rom
    - name: bzip2 -cd /usr/local/share/x48/gxrom-r.bz2 > /etc/skel/.hp48/rom
    - require:
      - file: gxrom-r-archive
{% endif %}
