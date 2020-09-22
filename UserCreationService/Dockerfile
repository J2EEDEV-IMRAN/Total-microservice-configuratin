FROM maven:3.6.3-jdk-11 AS builder
WORKDIR /opt/app
ADD . /opt/app

#RUN mvn install -DskipTests

VOLUME /tmp
#COPY --from=builder /opt/app/target/GononetUserCreationService.jar GononetUserCreationService.jar

ADD target/GononetUserCreationService.jar GononetUserCreationService.jar
EXPOSE 8686
ENTRYPOINT ["java", "-jar", "GononetUserCreationService.jar"]