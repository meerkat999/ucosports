@echo off
start "UCOSPORTS-PLAYER-MS" java -jar %cd%/ucosports-player-ms/target/deploy-swarm.jar
start "UCOSPORTS-WEB" java -jar %cd%/ucosports-web/target/deploy-swarm.jar -Dswarm.port.offset=1