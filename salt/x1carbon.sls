# TODO: slack -- https://downloads.slack-edge.com/linux_releases/slack-desktop-2.1.0-amd64.deb
# TODO: google-chrome
# TODO: pip install pgcli

install_packages:
  pkg:
    - installed
    - pkgs:
      - vim-nox-py2
      - zsh
      - redshift-gtk
      - gnome-tweak-tool
      - unity-tweak-tool
      - pass
      - network-manager-vpnc
      - network-manager-vpnc-gnome
      - silversearcher-ag
      - python-pip
      - virtualenv
      - tmux
      # For command-t.
      - ruby-dev 
      - fonts-inconsolata
      - xsel
      - libpq-dev
      - docker.io

install_dropbox:
  pkg.installed:
    - sources:
      - dropbox: https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2015.10.28_amd64.deb


{% for usr in ['job', 'jamesob'] %}

{{ usr }}:
  user.present:
    - shell: /bin/zsh
    - home: /home/{{ usr }}
    - groups: [sudo, job, docker]
 
/home/{{ usr }}/Dropbox:
  file.symlink:
    - target: /usr/share/Dropbox
    - group: job
    - user: {{ usr }}
     
/home/{{ usr }}/Music:
  file.symlink:
    - target: /home/{{ usr }}/Dropbox/music
    - group: job
    - user: {{ usr }}
              
/home/{{ usr }}/code:
  file.symlink:
    - target: /home/{{ usr }}/Dropbox/code
    - group: job
    - user: {{ usr }}
              
/home/{{ usr }}/dotfiles:
  file.symlink:
    - target: /usr/share/dotfiles
    - group: job
    - user: {{ usr }}

/home/{{ usr }}/bin:
  file.symlink:
    - target: /home/{{ usr }}/dotfiles/bin
    - group: job
    - user: {{ usr }}

/home/{{ usr }}/.desk:
  file.symlink:
    - target: /usr/share/Dropbox/code/desk_conf
    - group: job
    - user: {{ usr }}

/home/{{ usr }}/.password-store:
  file.symlink:
    - target: /usr/share/Dropbox/passwords/password-store
    - group: job
    - user: {{ usr }}

/home/{{ usr }}/.rbenv:
  file.directory:
    - group: job
    - user: {{ usr }}
                        
{% endfor %}


/home/jamesob/counsyl:
  file.directory:
    - user: jamesob


/usr/bin/desk:
  file.symlink:
    - target: /usr/share/Dropbox/code/desk/desk
    - group: job
