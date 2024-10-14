# Karate API Testing Automation

## Introduction
This project demonstrates the use of the Karate framework for automating REST API tests. The goal is to automate both positive and negative test cases for user-related operations such as creating, fetching, updating, and deleting users from the GoRest API.

## Features
- Automates REST API testing with Karate framework.
- Includes test cases for `POST`, `GET`, `PUT`, and `DELETE` operations on users.
- Validates response status codes and response body content.
- Handles positive and negative test scenarios.
- Detailed test reports are generated after execution.

## Prerequisites
- **Java JDK** (version 8 or higher)
- **Maven** for managing dependencies
- **IDE**: IntelliJ IDEA (or any IDE with Maven support)
- **Git** for version control

## Installation and Setup
1. Clone the repository from GitHub:
   
   git clone https://github.com/Govardhan-ZopSmart/Automating-REST-API
   

2. Navigate to the project directory:
   cd Automating-REST-API
   

3. Install Maven dependencies:
   mvn clean install
   

4. Make sure you have your GoRest API authentication token for executing the tests.

## Running Tests
To execute all the test cases, run the following Maven command:
mvn test


## Project Structure


karate-api-testing
 ├── .vscode                           # Configuration files for Visual Studio Code
 ├── src
 │   └── test
 │       └── java
 │           └── examples
 │               ├── get-users.feature # Test cases for GET user
 │               ├── post-user.feature # Test cases for POST user
 │               ├── put-user.feature  # Test cases for PUT user
 │               └── delete-user.feature # Test cases for DELETE user
 │           ├── karate-config.js      # Configuration for Karate
 │           └── logback-test.xml      # Logger configuration
 ├── target                            # Output folder for compiled code and test results
 ├── pom.xml                           # Maven configuration file
 └── README.md                         # Documentation


## Writing Tests
The test cases are written in Karate's Gherkin syntax and include both positive and negative scenarios for testing CRUD operations on the `/public/v1/users` endpoint.

### Example Test Case: `POST` request in `post-user.feature`

Feature: User API tests

  Scenario: Create a new user
    Given url 'https://gorest.co.in/public/v1/users'
    And header Authorization = 'Bearer' + 'b6aa90c55a3f83552a24ef7962bed996ea747cef8d7f831d356de59cddc558a8'
    And request { "name": "Ankit Rajput", "email": "ankitrajput@gmail.com", "gender": "male", "status": "active" }
    When method POST
    Then status 201
    And match response.name == 'Ankit Rajput'


## Test Reporting and Execution Result
After running the tests, Karate generates detailed HTML reports. You can find the test report at:

target/karate-reports/karate-summary.html


### Sample Test Execution Result

![Test Execution Result](path_to_your_screenshot.png)

Open the `karate-summary.html` file in your browser to view detailed results including passed/failed test cases and response times.
