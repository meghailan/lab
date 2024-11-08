# Stage 1: Build Stage
FROM maven:3.8.4-openjdk-11-slim AS builder

# Set the working directory
WORKDIR /app

# Copy the pom.xml and source code
COPY pom.xml .
COPY src ./src

# Build the application using Maven
RUN mvn clean package

# Stage 2: Runtime Stage
FROM openjdk:11-jre-slim

# Copy the JAR file from the builder stage
COPY --from=builder /app/target/simple-java-project-1.0-SNAPSHOT.jar /app/app.jar

# Command to run the application
CMD ["java", "-jar", "/app/app.jar"]
