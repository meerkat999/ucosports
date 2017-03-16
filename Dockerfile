FROM java:8
ADD ucosports-player-ms/target/deploy-swarm.jar /opt/ucosports-player-ms-swarm.jar
EXPOSE 8082:8082
ENTRYPOINT ["java", "-jar", "/opt/ucosports-player-ms-swarm.jar", "-Dswarm.port.offset=2"] 