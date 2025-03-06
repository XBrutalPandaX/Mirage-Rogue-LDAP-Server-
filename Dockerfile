FROM debian:latest

ENV DEBIAN_FRONTEND=noninteractive

# Install OpenLDAP and LDAP utilities
RUN apt-get update && apt-get install -y \
    slapd \
    ldap-utils \
    && rm -rf /var/lib/apt/lists/*

# Set up slapd database (this prevents interactive setup issues)
RUN echo "slapd slapd/no_configuration boolean false" | debconf-set-selections && \
    dpkg-reconfigure slapd

# Create the LDIF file for configuring SASL security properties
RUN echo "dn: cn=config" > /tmp/olcSaslSecProps.ldif && \
    echo "replace: olcSaslSecProps" >> /tmp/olcSaslSecProps.ldif && \
    echo "olcSaslSecProps: noanonymous,minssf=0,passcred" >> /tmp/olcSaslSecProps.ldif

# Copy entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Expose LDAP port
EXPOSE 389

# Run the entrypoint script
ENTRYPOINT ["/entrypoint.sh"]
