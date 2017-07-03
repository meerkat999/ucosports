@echo off

start "HOTELTURIN-MS" java -jar %cd%/hotelturin-ms/target/deploy-swarm.jar --profile=default

start "HOTELTURIN-WEB" java -jar %cd%/hotelturin-web/target/deploy-swarm.jar