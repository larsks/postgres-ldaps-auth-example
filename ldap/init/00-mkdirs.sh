#!/bin/sh

install -d -m 700 -o ldap -g ldap /var/lib/openldap/example.com /etc/certs
install -m 644 -o ldap -g ldap /data/certs/ldap.crt /etc/certs
install -m 600 -o ldap -g ldap /data/certs/ldap.key /etc/certs

cat > /etc/openldap/ldap.conf <<EOF
TLS_CACERT /etc/certs/ldap.crt
EOF
