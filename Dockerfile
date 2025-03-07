FROM debian:latest

ENV DEBIAN_FRONTEND=noninteractive


RUN apt-get update && apt-get install -y \
    slapd \
    ldap-utils \
    tcpdump \
    && rm -rf /var/lib/apt/lists/*


RUN echo "slapd slapd/no_configuration boolean false" | debconf-set-selections && \
    dpkg-reconfigure slapd


RUN echo "dn: cn=config" > /tmp/olcSaslSecProps.ldif && \
    echo "replace: olcSaslSecProps" >> /tmp/olcSaslSecProps.ldif && \
    echo "olcSaslSecProps: noanonymous,minssf=0,passcred" >> /tmp/olcSaslSecProps.ldif


COPY entrypoint.sh /entrypoint.sh
COPY tcpdump.sh /tcpdump.sh
RUN chmod +x /entrypoint.sh /tcpdump.sh


EXPOSE 389


ENTRYPOINT ["/bin/bash", "-c", "/entrypoint.sh & /tcpdump.sh"]