Feature: Create a new user via GoRest API

Background:
    * url 'https://gorest.co.in/public/v1'
    * def authToken = 'b6aa90c55a3f83552a24ef7962bed996ea747cef8d7f831d356de59cddc558a8'
    * header Authorization = 'Bearer ' + authToken

#Positive Case - Create a User Successfully
# Scenario: create a new user successfully
#     Given path 'users'
#     And request
#     """
#     {
#         "name": "Ankit Rajput",
#         "email": "ankitrajput9876@example.com",
#         "gender": "male",
#         "status": "active"
#     }
#     """
#     When method POST
#     Then status 201
#     And match response.data.name == "Ankit Rajput"
#     And match response.data.email == "ankitrajput9876@example.com"
#     And match response.data.gender == "male"
#     And match response.data.status == "active"
#     And print response

# 7454254 , 7454255, 7454263

# Negative Case - Create a user with an invalid email format
Scenario: Fail to create a user with an invalid email format
    Given path 'users'
    And request 
    """
        {
            "name": "ankit rajput",
            "email": "ankitrajpuail.com",
            "gender": "male",
            "status": "active"
        }
    """
    When method POST
    Then status 422
    And match response.data[0].field == 'email'
    And match response.data[0].message == 'is invalid'
    And print response

# Negative Case - Create a user with blank name
Scenario: Fail to create a user with a blank name
    Given path 'users'
    And request 
    """
        {
            "name": "",
            "email": "ankit@gmail.com",
            "gender": "male",
            "status": "active"
        }
    """
    When method POST
    Then status 422
    And match response.data[0].field == 'name'
    And match response.data[0].message == "can't be blank"
    And print response

# Negative Case - Create a user with blank gender
Scenario: Fail to create a user with blank gender
    Given path 'users'
    And request 
    """
        {
            "name": "ankit rajput",
            "email": "ankit@gmail.com",
            "gender": "",
            "status": "active"
        }
    """
    When method POST
    Then status 422
    And match response.data[0].message == "can't be blank, can be male of female"
    And print response

# Negative Case - Create a user with blank status
Scenario: Fail to create a user with blank status
    Given path 'users'
    And request 
    """
        {
            "name": "ankit rajput",
            "email": "ankit@gmail.com",
            "gender": "male"
            
        }
    """
    When method POST
    Then status 422
    And match response.data[0].field == 'status'
    And match response.data[0].message == "can't be blank"
    And print response

# Negative Case - Create a user with invalid status
Scenario: Fail to create a user with invalid status
    Given path 'users'
    And request 
    """
    { "name": "Ankit Rajput", "email": "ankitrajput@gmail.com", "gender": "male", "status": "invalid" }
    """
    When method POST
    Then status 422
    And match response.data[0].field == 'status'
    And match response.data[0].message == "can't be blank"
    And print response
