Add Remi repo

add php 5.6 remi repo

`[remi-php56]
name=Remi's PHP 5.6 RPM repository for Enterprise Linux 6 - $basearch
#baseurl=http://rpms.remirepo.net/enterprise/6/php56/$basearch/
mirrorlist=http://rpms.remirepo.net/enterprise/6/php56/mirror
# NOTICE: common dependencies are in "remi-safe"
enabled=1
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-remi `

Build the image:
`docker build --rm -t neroinc/fedora-apache-php .`

Start a container with an interactive shell and port 80 published:
`docker run -it -p 80:80 neroinc/fedora-apache-php /bin/bash`