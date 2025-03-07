from ldap3 import Server, Connection, ALL, SIMPLE, SUBTREE

# LDAP server details
LDAP_SERVER = "ldap://localhost"  # Localhost LDAP server
BASE_DN = "dc=mike,dc=com"  # Change this to match your LDAP setup
USER_DN = "cn=Pet ,dc=mike,dc=com"  # LDAP admin user
PASSWORD = "General"  # Change this to your admin password

try:
    # Connect to the LDAP server
    server = Server(LDAP_SERVER, get_info=ALL)
    conn = Connection(server, user=USER_DN, password=PASSWORD, authentication=SIMPLE, auto_bind=True)

    print("[+] Successfully connected to LDAP server!")

    # Search for all users
    conn.search(BASE_DN, "(objectClass=person)", search_scope=SUBTREE, attributes=['cn', 'uid', 'mail'])
    
    # Print search results
    for entry in conn.entries:
        print(entry)

    # Close connection
    conn.unbind()

except Exception as e:
    print("[-] Failed to connect:", str(e))
