class named (
	$allowquery = '192.168.43.0/24',
	$forwarders = '192.168.43.3',
	$masters = '192.168.43.1',
) {
	package {'named':
		name => 'named',
		ensure => 'installed',
	}

	$vari = {
		'allow-query' => $allowquery,
		'forwarders' => $forwarders,
		'masters' => $masters,
	}

	service {'named':
		ensure => running,
		enable => true,
		require => Package['named'],
		subscribe => File['/etc/named.conf'],
	}

	service {'firewalld':
		ensure => running,
		enable => ture,
	}

	file {'/etc/named.conf':
		owner => 'root',
		group => 'root',
		mode => '0554',
		content => epp('named/named.conf.epp',$vari),
	}

}