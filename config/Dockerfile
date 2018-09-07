FROM inlineno1/amazonlinux2:latest
MAINTAINER james lee <inlineno1@gmail.com>

ADD ./target/config.jar /app/
CMD ["java", "-Xmx200m", "-jar", "/app/config.jar"]

EXPOSE 8888