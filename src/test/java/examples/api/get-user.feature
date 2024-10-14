Feature: Get the user

Background:
    * url 'https://gorest.co.in/public/v1'
    * def authToken = 'b6aa90c55a3f83552a24ef7962bed996ea747cef8d7f831d356de59cddc558a8'
    * header Authorization = 'Bearer ' + authToken

Scenario: Fetch details of an existing user
    Given path 'users', '7454254'  
    When method GET
    Then status 200
    And match response.data.id == 7454254  
    And match response.data.name == 'Ankit Rajput'  
    And match response.data.email == 'ankitrajput98@example.com'  
    And match response.data.gender == 'male'  
    And match response.data.status == 'active'  
    And print response

# Verify that the user has been deleted
Scenario: Fail to fetch user details with a deleted user id
    Given path 'users', '7454263'
    When method GET
    Then status 404
    And match response.data.message == "Resource not found"
    And print response


# Scenario: Validate user not found with an invalid ID
Scenario: Fail to fetch user details with an invalid id
    Given path 'users', '999999'
    When method GET
    Then status 404
    And match response.data.message == "Resource not found"
    And print response

# Scenario: Validate response when providing malformed ID
Scenario: Fail to fetch the user with a malformed id
    Given path 'users', 'abc123'
    When method GET
    Then status 404
    And match response.data.message == "Resource not found"
    And print response

# Scenario: Validate response for deleted user ID
Scenario: Fail to fetch details for a deleted user ID
    Given path 'users','7453627'  
    When method GET
    Then status 200
    And match response.data.message == "#notpresent"  
    And print response

# Scenario: Ensure the system returns a default response when no ID is provided in the URL
Scenario: Fetch user details when no ID is provided
    Given path 'users'
    When method GET
    Then status 200  
    And def totalUsers = response.meta.pagination.total  
    And assert totalUsers > 0  
    And print response