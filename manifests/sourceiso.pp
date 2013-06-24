# == Define::buildserver::sourceiso
#
# This define mounts an ISO to the /var/www/html/sources folder
#
# === Parameters
#
# [*isolocation*]
#  String. Location in the filesystem of the ISO file to be mounted
#
# === Examples
#
#  buildserver::sourceiso{'Centos6':
#    isolocation => '/var/ISOs/CentOS-6.4-x86_64-bin-DVD1.iso',
#  }
#
# === Removal:
#
#     Manual process right now, todo for the future
#
# Author
# ramgop

define buildserver::sourceiso($isolocation)
{
  # Ensure sources folder exists
  file {'/var/www/html/sources':
    path   => '/var/www/html/sources',
    ensure => 'directory'
  }

  # Ensure source tree directory exists
  file {"/var/www/html/sources/${name}":
    path   => "/var/www/html/sources/${name}",
    ensure => 'directory'
  }

  # Mount ISO to sources folder
  exec { "Mounting ${isolocation} to /var/www/html/sources/${name}":
    command => "/bin/mount -o loop ${isolocation} /var/www/html/sources/${name}",
    onlyif  =>  "/bin/ls ${isolocation}",
    unless  => "/bin/df | /bin/grep /var/www/html/sources/${name}",
  }
}
