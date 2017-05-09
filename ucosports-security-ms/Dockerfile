FROM java:8
ADD target/deploy-swarm.jar /opt/ucosports-security-ms-swarm.jar
ENTRYPOINT ["java", "-jar", "/opt/ucosports-security-ms-swarm.jar", "--profile=production"] 