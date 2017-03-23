@echo off
start "UCOSPORTS-TOURNAMENT-MS" java -jar %cd%/ucosports-tournament-ms/target/deploy-swarm.jar -Dswarm.port.offset=2
start "UCOSPORTS-WEB" java -jar %cd%/ucosports-web/target/deploy-swarm.jar -Dswarm.port.offset=1