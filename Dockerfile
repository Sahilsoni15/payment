FROM eclipse-temurin:17-jdk-jammy

EXPOSE 8088

COPY target/paymentservice-0.0.1-SNAPSHOT.jar paymentservice-0.0.1-SNAPSHOT.jar

# Pass the active Spring profile (dev or qa) at runtime
# Default profile is set to 'default' but it can be overridden
ARG SPRING_PROFILES_ACTIVE=default
ENV SPRING_PROFILES_ACTIVE=${SPRING_PROFILES_ACTIVE}

ENTRYPOINT ["sh", "-c", "java -Dspring.profiles.active=${SPRING_PROFILES_ACTIVE} -jar paymentservice-0.0.1-SNAPSHOT.jar"]
