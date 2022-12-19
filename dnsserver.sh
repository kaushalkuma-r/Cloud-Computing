#!/bin/bash
#Run as a superuser

apt install bind9
cd /etc/bind/
echo "
//
// Do any local configuration here
//

// Consider adding the 1918 zones here, if they are not used in your
// organization
//include \"/etc/bind/zones.rfc1918\";

zone \"dns.cdac\" {
        type master;
        file \"dns.db\";
};" > named.conf.local
cp db.local /var/cache/bind/dns.db
echo "
$TTL	604800
@	IN	SOA	dns.cdac. root.dns.cdac. (
			      2		; Serial
			 604800		; Refresh
			  86400		; Retry
			2419200		; Expire
			 604800 )	; Negative Cache TTL
;
	IN	NS	dns.cdac. 
	IN	A	192.168.122.24
	IN	AAAA	1::1
www     IN      A       10.0.0.1
" > /var/cache/bind/dns.db
named-checkconf
named-checkzone dns.cdac /var/cache/bind/dns.db
systemctl restart bind9
