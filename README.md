# Home Test API

This repository contains a set of API tests for the "automaticbytes/demo-app" using the Karate Framework. The tests are built with Maven.

## Prerequisites

Before you begin, ensure you have the following installed on your system:

* **Java 11 or higher**: The project is configured to use Java 11.
* **Maven**: The project's build tool.
* **Docker**: Required for running the API and tests in a containerized environment.

## Getting Started


### 1. Set up the api localy
- Pull the docker image containing the api docker pull automaticbytes/demo-app
- Run the image docker run -p 3100:3100 automaticbytes/demo-app
- Verify the api is up and set it as the base url for the tests http://localhost:3100/api

### 1. Clone the Repository

 clone this repository to your local machine move 2 folders forward:

```sh
git clone https://github.com/solecampa/home-test-api
cd home-test-api
``` 
Execute 

```sh
mvn clean install
```
then execute
```sh
mvn compile
``` 
then execute
```sh
mvn test -Dtest=InventoryRunner
``` 
## Run Tests from UI
- Test can also be run from the Visual studio UI or from an IntelliJ IDEA or Eclipse, by clicking in the "Play button"

<img width="1418" height="694" alt="image" src="https://github.com/user-attachments/assets/235adf33-8a43-4eff-8cc6-a9b4a5c22a08" />





