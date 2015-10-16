# == Class: x2go
#
# This module installs X2Go Server on Ubuntu Trusty (for now)
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  class { x2go:
#  }
#  
#  or
#
#  include x2go
#
# === Authors
#
# st01tkh <st01tkh@gmail.com>
#
# === Copyright
#
# Copyright 2015 st01tkh
#
class x2go {
  case $operatingsystem {
  'Solaris':          {
    notify {'No action for Solaris yet':}
  }
  'RedHat', 'CentOS': {
    notify {'No action for RedHat and/or CentOS yet':} 
  }
  /^(Ubuntu)$/:{
    case $lsbdistcodename {
    'precise': {
    }
    'trusty': {
        exec {"add_x2go_repo":
          command => "add-apt-repository -y ppa:x2go/stable",
          path => [ '/bin', '/sbin', '/usr/bin', '/usr/sbin', '/usr/local/bin', '/usr/local/sbin' ]
        }
        exec {"up_x2go_repo":
          command => "apt-get -y update",
          path => [ '/bin', '/sbin', '/usr/bin', '/usr/sbin', '/usr/local/bin', '/usr/local/sbin' ]
        }
        package {"x2goserver":
          ensure => 'installed',
        }

        Exec["add_x2go_repo"]->
        Exec["up_x2go_repo"]->
        Package["x2goserver"]
    }
    }
  }
  /^(Debian)$/:{
    notify {'No action for Debian yet':}
  }
  default: {
    notify {'No action by default':}
  }
  }


}
