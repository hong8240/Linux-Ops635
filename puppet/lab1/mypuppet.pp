node "puppet-clinet1.yhong39.ops" {
        class{'webserver':}
        class{'firewall':}
}

node "puppet-client2.yhong39.ops" {
        class{'webserver':}
        class{'firewall':}

}

