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

```
karate-api-testing
 ├── .vscode                           
 ├── src
 │   └── test
 │       └── java
 │           └── examples
 │               ├── get-users.feature 
 │               ├── post-user.feature 
 │               ├── put-user.feature  # Test cases for PUT user
 │               └── delete-user.feature # Test cases for DELETE user
 │           ├── karate-config.js      # Configuration for Karate
 │           └── logback-test.xml      # Logger configuration
 ├── target                            # Output folder for compiled code and test results
 ├── pom.xml                           # Maven configuration file
 └── README.md                         # Documentation

```

## Writing Tests
The test cases are written in Karate's Gherkin syntax and include both positive and negative scenarios for testing CRUD operations on the `/public/v1/users` endpoint.

### Example Test Case: `POST` request in `post-user.feature`
```
Feature: User API tests

  Scenario: Create a new user
    Given url 'https://gorest.co.in/public/v1/users'
    And header Authorization = 'Bearer' + 'b6aa90c55a3f83552a24ef7962bed996ea747cef8d7f831d356de59cddc558a8'
    And request { "name": "Ankit Rajput", "email": "ankitrajput@gmail.com", "gender": "male", "status": "active" }
    When method POST
    Then status 201
    And match response.name == 'Ankit Rajput'
```

## Test Reporting and Execution Result
After running the tests, Karate generates detailed HTML reports. You can find the test report at:

target/karate-reports/karate-summary.html


### Sample Test Execution Result
<img width="1680" alt="Screenshot 2024-10-07 at 5 26 40 PM" src="https://github.com/user-attachments/assets/e7f37615-ba4e-4f12-996a-4a6df676e9cc">

<img width="1680" alt="Screenshot 2024-10-07 at 5 26 35 PM" src="https://github.com/user-attachments/assets/e3d6ccbc-45f7-471c-87dd-a561a45db733">

<img width="1680" alt="Screenshot 2024-10-07 at 5 34 23 PM" src="https://github.com/user-attachments/assets/0173b30e-e05d-4154-ada9-9240d5a69837">

Open the `karate-summary.html` file in your browser to view detailed results including passed/failed test cases and response times.
