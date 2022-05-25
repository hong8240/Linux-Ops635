class postfix (
	$interfaces = 'all',
	$mydomain = 'yhong39.ops',
	$myorigin = '$mydomain',
) {
	package {'postfix':
		name => 'postfix',
		ensure => 'installed',
	}

	$vari = {
		'inet_interfaces' => $interfaces,
		'mydomain' => $mydomain,
		'myorigin' => $myorigin,
	}

	service {'postfix':
		ensure => running,
		enable => true,
		require => Package['postfix'],
		subscribe => File['/etc/postfix/main.cf'],
	}

	service {'firewalld':
		ensure => running,
		enable => ture,
	}

	file {'/etc/postfix/main.cf':
		owner => 'root',
		group => 'root',
		mode => '0554',
		content => epp('postfix/main.cf.epp',$vari),
	}

}

