# UCOSPORST - MICRO-SERVICES ARCHITECTURE

### INTRODUCTION:

The architecture of micro-services is proposed for the boom it is generating in the technological and development environment.

### BENEFITS:

* The microservices are small.
* They are independent of each other.
* High scalability. Each developer could work in a microservice without disturbing the work of another developer.
* Failures / errors only affect the microservice that generated it, not the entire project.

### LIST OF MICROSERVICES:
* UCOSPORTS-TOURNAMENT-MS : Wildfly Swarm
* UCOSPORTS-REPORTS-MS : Wildfly Swarm
* UCOSPORTS-INVENTORY-MS : Wildfly Swarm
* UCOSPORTS-WEB : Wildfly Swarm (not necesary Wildfly Swarm server, can be change for other server like Apache or Node.js because only contain the folder webapp)

#### NOTE:
UCOSPORTS-TOURNAMENT-DOMAIN IS NOT A MICROSERVICE, is only a jar with the domain (entities, dtos and repositories of the domain).

### TECHNOLOGY STACK

* ENVIRONMENT:
  * MySql Server
  * MAVEN (Apache Maven)
  * Git (obviusly)
  * Docker *in progress*

* UCOSPORTS-TOURNAMENT-DOMAIN:
  * Java EE 7 (javax)
  * JPA (org.wildfly.swarm)
  * MySql Connector 
  * Spring Data JPA (org.springframework.data)
  
* UCOSPORTS-TOURNAMENT-MS:
  * WildFly Swarm Server
  * CDI (org.wildfly.swarm)
  * Jaxrs (org.wildfly.swarm)
  * Jaxrs-multipart (org.wildfly.swarm)
  * JUnit
  * Mockito

* UCOSPORTS-REPORTS-MS:
  * WildFly Swarm Server (org.wildfly.swarm)
  * *in progress
  
* UCOSPORTS-INVENTORY-MS:
  * WildFly Swarm Server (org.wildfly.swarm)
  * *in progress

* UCOSPORTS-WEB:
  * AngularJS
  * AngularAMD
  * Angular UI Router
  * JQuery

## INSTRUCTIONS

### ENVIRONMENT

#### CONNECTION POOL DB
To change the connection properties (url connection, schema, ports, users and passwords) to the database, edit the project-stages.yml file located at:

* UCOSPORTS-TOURNAMENT-MS : UCOSPORTS-TOURNAMENT-DOMAIN/src/main/resources/
* UCOSPORTS-REPORTS-MS : UCOSPORTS-REPORTS-MS/src/main/resources/
* UCOSPORTS-INVENTORY-MS : UCOSPORTS-INVENTORY-MS/src/main/resources/

### BUILD AND DEPLOY
#### ALL MICROSERVICES
* Go to the folder of the project.
* Run in command line 'mvn clean install -U' (Need MAVEN install in your device). This command install (build) ALL microservices.
* Run 'ucosports-run.bat' for run all the microservices. (This action will open command window for each microservice representing the server). This bat deploy each microservice.

#### ONE MICROSERVICE
* Go to the folder of the microservice.
* Run in command line 'mvn clean install -U' (Need MAVEN install in your device). (UCOSPORTS-TOURNAMENT-MS needs install UCOSPORTS-TOURNAMENT-DOMAIN firts).
* Run in the command line "java -jar deploy-swarm.jar". (This action will open command window for microservice representing the server).

#### NOTE
The build with MAVEN run all the tests. If any test fails, it will not compile. All tests must pass.

### RUN
All microservices run in the same ip, in development this ip will be 'localhost'. But each microservice, run into a different ports:

* UCOSPORTS-WEB : 8081
* UCOSPORTS-TOURNAMENT-MS : 8082
* UCOSPORTS-REPORTS-MS : 8083
* UCOSPORTS-INVENTORY-MS : 8084

  Example: http://localhost:8081/ to run UCOSPORTS-WEB.

