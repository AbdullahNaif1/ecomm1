FROM wildfly:latest
COPY standalone.xml /opt/jboss/wildfly/standalone/configuration/standalone.xml
COPY /target/*.war /opt/jboss/wildfly/standalone/deployments/
EXPOSE 8882
CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0"]
