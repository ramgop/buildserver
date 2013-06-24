# == Class: buildserver
#
# This module ensures an http server is installed
# and mounts an ISO into the /var/www/html/sources
# folder
#
# It is future intention to puppetise templates
#
# Author
# ramgop
#

class buildserver {
  package {'httpd':
    ensure  => installed,
  }

  service {'httpd':
    ensure  => running,
  }
}
