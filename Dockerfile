FROM quay.io/wildfly/wildfly:latest
COPY /target/*.war /opt/jboss/wildfly/standalone/deployments/
EXPOSE 8882
CMD ["/opt/jboss/wildfly/bin/standalone.sh"]
