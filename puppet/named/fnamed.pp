class fnamed (
	$allowqurey = '192.168.43.0/24',
	$recursion = 'yes'
){
	package {'named':
		name => 'named',
		ensure => 'installed',
	}

	$vari = {
		'allow-query' => $allowquery,
		'recursion' => $recursion,
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

	file {'/etc/postfix/main.cf':
		owner => 'root',
		group => 'root',
		mode => '0554',
		content => epp('named/fnamed.conf.epp',$vari),
	}

}