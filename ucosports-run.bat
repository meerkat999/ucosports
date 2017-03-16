@echo off
start "UCOSPORTS-TEAM-MS" java -jar %cd%/ucosports-team-ms/target/deploy-swarm.jar -Dswarm.port.offset=3
start "UCOSPORTS-PLAYER-MS" java -jar %cd%/ucosports-player-ms/target/deploy-swarm.jar -Dswarm.port.offset=2
start "UCOSPORTS-WEB" java -jar %cd%/ucosports-web/target/deploy-swarm.jar -Dswarm.port.offset=1