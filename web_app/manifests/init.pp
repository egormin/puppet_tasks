class web_app (
    $mysqlpassword_root = 'Zabbix_2015',
        $zabbix_db_name     = 'zabbix',
        $zabbix_db_user     = 'zabbix',
        $zabbix_db_password = 'zabbix',
        ) inherits web_app::params

{
        include ::web_app::java_install
        include ::web_app::jboss_install        
        include ::web_app::jboss_configure       

        notify { "Zabbix db name = $zabbix_db_name" :}
        notify { "Zabbix db user = $zabbix_db_user" :}
        notify { "Zabbix db password = $zabbix_db_password" :}
        notify { "Zabbix root pass for mysql = $mysqlpassword_root" :}
        notify { "Zabbix packages = $web_app::params::zabbix_packages" :}
}
