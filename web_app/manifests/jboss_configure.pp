class web_app::jboss_configure  (
        ) inherits web_app::params

 {
  exec { 'change ownership to jboss user':
    command     => "chown -R $jboss_user:$jboss_group $jboss_home",
    path        => '/bin/',
  }

  file { '/etc/jboss-as/':
    ensure => directory,
  }

  file { 'jboss_conf':
    path    => "/etc/jboss-as/jboss-as.conf",
    owner   => 'root',
    group   => 'root',
    content => template('web_app/jboss_conf.erb'),
  }

  file { 'jboss_init':
    path    => "/etc/init.d/jboss",
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    content => template('web_app/jboss_init.erb'),
  }

  service { 'jboss':
    ensure => running,
    enable => true,
  }


}

