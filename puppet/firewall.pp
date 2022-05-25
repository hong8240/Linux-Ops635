class profile::named {
	include named
	named::vhost { 'mysite':
	ensure => present,
		}

	firewall { 'named':
	dport  => [53],
	proto  => 'tcp',
	action => 'accept',
		}
}
