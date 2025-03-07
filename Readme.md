# Mirage - Rogue LDAP Server for Pass-back Attacks
Mirage is a rogue LDAP server designed to perform LDAP Pass-back attacks against misconfigured network devices, such as printers. By altering a device’s LDAP configuration to point to Mirage, authentication attempts can be intercepted to extract credentials.  
## 📌 How It Works  
1. **Gain Access** - Obtain access to a device’s LDAP configuration (e.g., a printer’s web interface).  
2. **Modify LDAP Server** - Change the LDAP server IP/hostname to point to Mirage.  
3. **Trigger Authentication** - Test the LDAP configuration to force an authentication attempt.  
4. **Intercept Credentials** - Mirage captures and logs the authentication request, revealing credentials.  

---

## 🛠️ Setup  
### Installation  
#### Running with Docker
Mirage comes with a Dockerfile that sets up an OpenLDAP server inside a container.
```bash
docker build -t mirage .
docker run --name mirage --privileged -p 389:389 -d mirage
```

### What the Dockerfile Does
- Installs OpenLDAP (slapd) and LDAP utilities.
- Configures the LDAP server to work without manual setup(Uses Plain text authentication and no ecnryption).
- Exposes port 389, which is used for LDAP authentication.
- Runs an entrypoint script (`entrypoint.sh`) to start the LDAP server.
- Runs the TCPdump to fetch credentials and save it to text file.

### Run LDAP Test Scripts
Navigate to the ldap_tests/ directory and run the test script:
## Future Plans
- [ ] Fetch credentials directly from LDAP  
