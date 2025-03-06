from ldap3 import Server, Connection, ALL, NTLM, SIMPLE, AUTO_BIND_NO_TLS


LDAP_SERVER = "ldap://localhost"  
BASE_DN = "dc=example,dc=com"  
USER_DN = "admin"  
PASSWORD = "adminpassowrd"  

def authenticate(user_dn, password):
    server = Server(LDAP_SERVER, get_info=ALL)
    try:
        conn = Connection(server, user_dn, password, auto_bind=AUTO_BIND_NO_TLS)
        print(f"✅ Authentication successful for {user_dn}")
        return True
    except Exception as e:
        print(f"❌ Authentication failed for {user_dn}: {e}")
        return False


authenticate(USER_DN, PASSWORD)
