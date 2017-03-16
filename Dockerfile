FROM java:8
ADD ucosports-player-ms/target/deploy-swarm.jar /opt/ucosports-player-ms-swarm.jar
ADD ucosports-web/target/deploy-swarm.jar /opt/ucosports-web-swarm.jar
EXPOSE 8080:8080
EXPOSE 8130:8130
EXPOSE 3306:3306
ENTRYPOINT ["java", "-jar", "/opt/ucosports-web-swarm.jar"]
ENTRYPOINT ["java", "-jar", "/opt/ucosports-player-ms-swarm.jar"]