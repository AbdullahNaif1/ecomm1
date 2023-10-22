FROM quay.io/wildfly/wildfly:latest
COPY standalone.xml /opt/jboss/wildfly/standalone/configuration/
COPY /target/*.war /opt/jboss/wildfly/standalone/deployments/
EXPOSE 8882
CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-c", "-b", "0.0.0.0"]
