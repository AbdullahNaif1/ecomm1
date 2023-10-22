# Use an official Java runtime as the base image
FROM jboss/wildfly
# Set the working directory in the container

# Copy the compiled Java application JAR (if available) to the container
COPY /target/*.war /opt/jboss/wildfly/standalone/deployments/

# Expose the port your application will run on (adjust as needed)
EXPOSE 8080

# Define the command to run your Java application
CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0"]
