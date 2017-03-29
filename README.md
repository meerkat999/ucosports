# UCOSPORST - MICRO-SERVICES ARCHITECTURE

### INTRODUCTION:

The architecture of micro-services is proposed for the boom it is generating in the technological and development environment.

### BENEFITS:

* The microservices are small.
* They are independent of each other.
* High scalability. Each developer could work in a microservice without disturbing the work of another developer.
* Failures / errors only affect the microservice that generated it, not the entire project.

### LIST OF MICROSERVICES:
* UCOSPORTS-TOURNAMENT : Wildfly Swarm
* UCOSPORTS-REPORTS : Wildfly Swarm
* UCOSPORTS-INVENTORY : Wildfly Swarm
* UCOSPORTS-WEB : Wildfly Swarm (not necesary Wildfly Swarm server, can be change for other server like Apache or Node.js because only contain the folder webapp)

#### NOTE:
UCOSPORTS-DOMAIN is only a jar with the domain (entities, dtos and repositories with spring data jpa).

## INSTRUCTIONS

### ENVIRONMENT

#### CONNECTION POOL DB
To change the connection properties (url connection, schema, ports, users and passwords) to the database, edit the project-stages.yml file located at:

* UCOSPORTS-TOURNAMENT : UCOSPORTS-DOMAIN/src/main/resources/
* UCOSPORTS-REPORTS : UCOSPORTS-REPORTS/src/main/resources/
* UCOSPORTS-INVENTORY : UCOSPORTS-INVENTORY/src/main/resources/

### BUILD AND DEPLOY
#### ALL MICROSERVICES
* Go to the folder of the project.
* Run in command line 'mvn clean install -U' (Need MAVEN install in your device). This command install (build) ALL microservices.
* Run 'ucosports-run.bat' for run all the microservices. (This action will open command window for each microservice representing the server). This bat deploy each microservice.

#### ONE MICROSERVICE
* Go to the folder of the microservice.
* Run in command line 'mvn clean install -U' (Need MAVEN install in your device). (UCOSPORTS-TOURNAMENT needs install UCOSPORTS-DOMAIN firts).
* Run in the command line "java -jar deploy-swarm.jar". (This action will open command window for microservice representing the server).

#### NOTE
The build with MAVEN run all the tests. If any test fails, it will not compile. All tests must pass.

### RUN
All microservices run in the same ip, in development this ip will be 'localhost'. But each microservice, run into a different ports:

* UCOSPORTS-WEB : 8081
* UCOSPORTS-TOURNAMENT : 8082
* UCOSPORTS-REPORTS : 8083
* UCOSPORTS-INVENTORY : 8084

  Example: http://localhost:8081/ to run UCOSPORTS-WEB.

# SOON PROJECT PROPERTIES: PORTS, URLS, POOLS, CONECTIONS.
