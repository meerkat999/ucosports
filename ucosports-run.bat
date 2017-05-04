@echo off
start "UCOSPORTS-TOURNAMENT-MS" java -jar %cd%/ucosports-tournament-ms/target/deploy-swarm.jar --profile=default
start "UCOSPORTS-WEB" java -jar %cd%/ucosports-web/target/deploy-swarm.jar
start "UCOSPORTS-SECURITY-MS" java -jar %cd%/ucosports-security-ms/target/deploy-swarm.jar