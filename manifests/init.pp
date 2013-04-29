class auditd {
  
  package { 'auditd':
    ensure => installed,
  }

  service { 'auditd':
    ensure  => running,
    enable  => true,
    require => Package['auditd'],
  }
  
  file { 'auditd.conf':
    path    => '/etc/audit/auditd.conf',
    content => template('auditd/auditd.conf.erb'),
    mode    => '0640',
    owner   => 'root',
    group   => 'root',
  }

  file { 'audit.rules':
    path    => '/etc/audit/audit.rules',
    content => template('auditd/audit.rules.erb'),
    mode    => '0640',
    owner   => 'root',
    group   => 'root',
  }
}