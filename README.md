Bring up the stack:

```
docker-compose up -d
```

Confirm postgres authentication settings:

```
$ docker-compose exec postgres grep ldaptls /var/lib/postgresl/data/pg_hba.conf
host all all all ldap ldapurl=ldap://ldap ldaptls=1 ldapprefix="cn=" ldapsuffix=",ou=users,dc=example,dc=com"
```

Test authentication:

```
$ docker run  --rm --network pgexample_default postgres:14 \
  psql postgresql://user1:secret1@postgres/user1 -c 'select 1'
 ?column?
----------
        1
(1 row)
```
