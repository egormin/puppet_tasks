class web_app::java_install {

  package { 'java':
    name   => $java_version,
    ensure  => installed,
  }
                       

}
