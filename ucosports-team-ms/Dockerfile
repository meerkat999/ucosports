FROM java:8
ADD target/deploy-swarm.jar /opt/ucosports-team-ms-swarm.jar
ENTRYPOINT ["java", "-jar", "/opt/ucosports-team-ms-swarm.jar", "-Dswarm.port.offset=3"] 