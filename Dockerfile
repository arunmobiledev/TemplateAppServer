FROM eclipse-temurin:21-jre-alpine

WORKDIR /app

# Copy JAR from repo
COPY server-standalone.jar app.jar

# Create data directory
RUN mkdir -p /app/data

# Expose port
EXPOSE 8080

# Run server
CMD ["java", \
     "-Xms256m", \
     "-Xmx512m", \
     "-XX:+UseSerialGC", \
     "-jar", "app.jar", \
     "8080", "0.0.0.0", "/app/data/server.db"]
