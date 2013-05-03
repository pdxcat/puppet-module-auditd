class auditd (
  $auditd_service_ensure = 'running',
  $auditd_service_enable = true,
){

  include auditd::params

  package { 'auditd':
    ensure => installed,
    name   => $auditd::params::package,
    before => File['auditd.conf'],
  }

  service { 'auditd':
    ensure  => $auditd_service_ensure,
    enable  => $auditd_service_enable,
    require => Package['auditd'],
  }

  file { 'auditd.conf':
    path    => '/etc/audit/auditd.conf',
    content => template('auditd/auditd.conf.erb'),
    mode    => '0640',
    owner   => 'root',
    group   => 'root',
    notify  => Service['auditd'],
  }

  file { 'audit.rules':
    path    => '/etc/audit/audit.rules',
    content => template('auditd/audit.rules.erb'),
    mode    => '0640',
    owner   => 'root',
    group   => 'root',
    notify  => Service['auditd'],
  }

  if ( $::lsbdistcodename in ['jaunty', 'lucid'] ) {
    file { '/sbin/audispd':
      mode    => '0750',
      require => Package['auditd'],
    }
  }
}
