class auditd::params {

  case $::osfamily {

    'Debian': {
      $package = 'auditd'
    }
    'Redhat': {
      $package = 'audit'
    }
    default: {
      fail("${::osfamily} is not supported.")
    }
  }
}
