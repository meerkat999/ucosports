FROM java:8
ADD target/deploy-swarm.jar /opt/ucosports-tournament-ms-swarm.jar
ENTRYPOINT ["java", "-jar", "/opt/ucosports-tournament-ms-swarm.jar", "-Dswarm.port.offset=2"] 