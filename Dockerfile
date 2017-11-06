
#
# fedora-apache-php
#
FROM ngutip/docker-apache-php56

# Install PHP and dependencies
dnf install --enablerepo=remi install php php-common php-mysqlnd php-pgsql php-pecl-mongo php-pdo php-pecl-memcache php-pecl-memcached php-gd php-xml php-mbstring php-mcrypt php-pecl-apcu php-cli php-pear -y
RUN pear install channel://pear.php.net/XML_Serializer-0.20.2
RUN pear install channel://pear.php.net/XML_Parser2-0.1.0

# Configure PHP using custom VirtualHost configuration
ADD virtualhosts.conf /etc/httpd/conf.d/virtualhosts.conf

# We have all code in /src
WORKDIR /src
ADD index.php /src/index.php
RUN rm -rf /var/www/html; ln -s /src /var/www/html
