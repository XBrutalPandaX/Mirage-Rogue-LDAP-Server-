


slapd -h "ldap:/// ldapi:///" -u openldap -g openldap -d 0 &
sleep 3


ldapmodify -Y EXTERNAL -H ldapi:/// -f /tmp/olcSaslSecProps.ldif


rm -f /tmp/olcSaslSecProps.ldif


wait -n
