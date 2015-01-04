# -*- mode: yaml -*-
{% if salt['pillar.get']('pkgsets:build-xxdiff-binary', False) %}
hg-packages:
  pkg.installed:
    - pkgs:
      - mercurial
      

xxdiff-source-tarball:
  file.managed:
    - name: /usr/src/xxdiff-4.0.tar.bz2
    - source: http://downloads.sourceforge.net/project/xxdiff/xxdiff/4.0/xxdiff-4.0.tar.bz2
    - source_hash: sha256=91501544e82bc89983d07eeb086419645fbfa78fc906b50ff7ab6cdf39431330

xxdiff-local-hg-repo:
  hg.latest:
    - name: https://hg.furius.ca/public/xxdiff/
    - target: /usr/src/xxdiff
    # bypass unknown ssl cert
    - opts: --insecure
      
      
xxdiff-builddeps:
  pkg.installed:
    - pkgs:
      - bison
      - flex
      - libqt4-dev

#build-xxdiff-binary:
#  cmd.script:
#    - requires:
#      - file: xxdiff-source-tarball
#      - pkg: xxdiff-builddeps
#    - source: salt://files/build-xxdiff-binary.sh
#    - unless: test -x /usr/local/bin/xxdiff


{% endif %}
