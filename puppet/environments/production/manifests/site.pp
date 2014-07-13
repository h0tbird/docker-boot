#------------------------------------------------------------------------------
# Stages:
#------------------------------------------------------------------------------

stage { 'pre':  before  => Stage['main'] }
stage { 'post': require => Stage['main'] }

#------------------------------------------------------------------------------
# Enable the Puppet 4 behavior today:
#------------------------------------------------------------------------------

Package { allow_virtual => true }

#------------------------------------------------------------------------------
# Docker builds don't mess with services:
#------------------------------------------------------------------------------

if $::docker_build {
  Service <||> {
    hasrestart => true,
    hasstatus  => true,
    restart    => '/bin/true',
    stop       => '/bin/true',
    start      => '/bin/true',
    status     => '/bin/true',
  }
}

#------------------------------------------------------------------------------
# Include:
#------------------------------------------------------------------------------

include ::r_dnsmasq
