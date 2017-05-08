docker run --name db -d -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=ucosportstournament -p 3306:3306 mysql
docker run --name webcontainer --link db:db -p 8081:8081 -d webimage
docker run --name tournamentcontainer --link db:db -p 8082:8082 -d tournamentimage
