class webserver (
        $port = '8080',
        $serveradmin = 'root@yhong39.ops',
) {
        package {'httpd':
                name => 'httpd',
                ensure => 'installed',
        }

        $vari = {
                'port' => $port,
                'serveradmin' => $serveradmin,
        }

        service {'httpd':
                ensure => running,
                enable => true,
                require => Package['httpd'],
                subscribe => File['/etc/httpd/conf/httpd.conf'],
        }

        service {'firewalld':
                ensure => running,
                enable => ture,
        }

        file {'/etc/httpd/conf/httpd.conf':
                owner => 'root',
                group => 'root',
                mode => '0554',
                content => epp('webserver/httpd.conf.epp',$vari),
        }

        file {'directory index':
                path => '/var/www/html/index.html',
                owner => 'apache',
                group => 'apache',
                mode => '0554',
                content => 'This is Youngtak Hong Homepage',
        }

}

