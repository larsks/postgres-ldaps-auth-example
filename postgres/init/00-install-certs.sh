#!/bin/sh

: "${PGDATA:=/var/lib/postgresql/data}"

mkdir "${PGDATA}"/certs
cp /data/certs/ldap.crt "${PGDATA}"/certs

# Configure libldap to use ldap.crt as the CA certificate.
# This will require us to set LDAPCONF to ${PGDATA}/ldap.conf
# when booting the postgres container.
cat > "${PGDATA}/ldap.conf" <<EOF
TLS_CACERT ${PGDATA}/certs/ldap.crt
EOF
