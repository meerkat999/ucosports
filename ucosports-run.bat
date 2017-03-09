@echo off
start "UCOSPORTS-JUGADOR-MS" java -jar %cd%/ucosports-jugador-ms/target/deploy-swarm.jar -Dswarm.port.offset=10 
start "UCOSPORTS-WEB" java -jar %cd%/ucosports-web/target/deploy-swarm.jar