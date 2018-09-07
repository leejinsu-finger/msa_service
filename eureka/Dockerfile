FROM inlineno1/amazonlinux2:latest
MAINTAINER james lee <inlineno1@gmail.com>

ADD ./target/eureka.jar /app/
CMD ["java", "-Xmx200m", "-jar", "/app/eureka.jar"]

EXPOSE 8761
