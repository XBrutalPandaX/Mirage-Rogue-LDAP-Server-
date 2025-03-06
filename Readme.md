# Mirage - Rogue LDAP Server for Pass-back Attacks  

Mirage is a rogue LDAP server designed to perform LDAP Pass-back attacks against misconfigured network devices, such as printers. By altering a device’s LDAP configuration to point to Mirage, authentication attempts can be intercepted to extract credentials.  
---

## 📌 How It Works  
1. **Gain Access** - Obtain access to a device’s LDAP configuration (e.g., a printer’s web interface).  
2. **Modify LDAP Server** - Change the LDAP server IP/hostname to point to Mirage.  
3. **Trigger Authentication** - Test the LDAP configuration to force an authentication attempt.  
4. **Intercept Credentials** - Mirage captures and logs the authentication request, revealing credentials.  

---

## 🛠️ Setup  
### Requirements  
- Docker  
- Python 3.x  
- `ldap3` and `scapy` (Install via `pip install ldap3 scapy`)  

### Installation  
```bash
git clone https://github.com/yourusername/mirage.git  
cd mirage  
pip install -r requirements.txt  
```
## Running with Docker
Mirage comes with a Dockerfile that sets up an OpenLDAP server inside a container.

### What the Dockerfile Does
1. Uses Debian as the base image.
2. Installs OpenLDAP (slapd) and LDAP utilities.
3. Configures the LDAP server to work without manual setup.
4. Exposes port 389, which is used for LDAP authentication.
5. Runs an entrypoint script (entrypoint.sh) to start the LDAP server.

## 🚀 Running with Docker

Mirage comes with a Dockerfile that sets up an OpenLDAP server inside a container.

### What the Dockerfile Does
- Installs OpenLDAP (slapd) and LDAP utilities.
- Configures the LDAP server to work without manual setup.
- Exposes port 389, which is used for LDAP authentication.
- Runs an entrypoint script (`entrypoint.sh`) to start the LDAP server.

### Build and Run the Container

```bash
docker build -t mirage .
docker run -p 389:389 mirage
```
## Testing the Server
To ensure the LDAP server is running and configured properly, you can use the test scripts inside the ldap_tests/ folder.
### Run LDAP Test Scripts
Navigate to the ldap_tests/ directory and run the test script:
```bash
cd ldap_tests  
python ldap_test.py
```
