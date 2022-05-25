class profile::apache {
	include apache
	apache::vhost { 'mysite':
	ensure => present,
			}

	firewall { 'httpd':
	dport  => [8080, 443],
	proto  => 'tcp',
	action => 'accept',
		  }
}
