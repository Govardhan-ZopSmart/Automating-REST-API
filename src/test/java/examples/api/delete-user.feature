Feature: Delete User

Background:
    * url 'https://gorest.co.in/public/v1'
    * def authToken = 'b6aa90c55a3f83552a24ef7962bed996ea747cef8d7f831d356de59cddc558a8'
    * header Authorization = 'Bearer ' + authToken

# Scenario: Successfully delete an existing user
#     Given path 'users', '7454263'  
#     When method DELETE
#     Then status 204  

#     # Verify that the user has been deleted
#     Given path 'users', '7454263'
#     When method GET
#     Then status 404
#     And match response.data.message == "Resource not found"

Scenario: Fail to delete a non-existing user
    Given path 'users', '999999'  
    When method DELETE
    Then status 404
    And match response.data.message == "Resource not found"

Scenario: Fail to delete without authorization token
    Given path 'users', '7454263'
    * header Authorization = null  
    When method DELETE
    Then status 404
    And match response.data.message == "Resource not found"

Scenario: Fail to delete with invalid authorization token
    Given path 'users', '7454263'
    * header Authorization = 'Bearer invalid_token'  
    When method DELETE
    Then status 401
    And match response.data.message == "Invalid token"

Scenario: Fail to delete with invalid user ID format
    Given path 'users', 'abc123'  
    When method DELETE
    Then status 404
    And match response.data.message == "Resource not found"

Scenario: Fail to delete a user that is already deleted
    Given path 'users', '7454263'  
    When method DELETE
    Then status 404  

    # Attempt to delete the same user again
    Given path 'users', '7454263'
    When method DELETE
    Then status 404
    And match response.data.message == "Resource not found"
