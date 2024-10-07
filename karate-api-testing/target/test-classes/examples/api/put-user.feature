Feature: Update existing user details via GoRest API

Background:
    * url 'https://gorest.co.in/public/v1'
    * def authToken = 'b6aa90c55a3f83552a24ef7962bed996ea747cef8d7f831d356de59cddc558a8'
    * header Authorization = 'Bearer ' + authToken

# Scenario: Validate updating name for an existing user
Scenario: Successfully update name for an existing user
    Given path 'users', '7454255'  
    And request 
    """
    { 
        "name": "Ankit Kumar" 
    }
    """
    When method PUT
    Then status 200
    And match response.data.name == 'Ankit Kumar'
    And print response

# Scenario: Validate updating email for an existing user
Scenario: Successfully update email for an existing user
    Given path 'users', '7454255'  
    And request 
    """
    { 
        "email": "ankit.kumar987@example.com" 
    }
    """
    When method PUT
    Then status 200
    And match response.data.email == 'ankit.kumar987@example.com'
    And print response

# Scenario: Validate updating gender for an existing user
Scenario: Successfully update gender for an existing user
    Given path 'users', '7454255'  
    And request 
    """
    { 
        "gender": "female" 
    }
    """
    When method PUT
    Then status 200
    And match response.data.gender == 'female'
    And print response

# Scenario: Validate updating status for an existing user
Scenario: Successfully update status for an existing user
    Given path 'users', '7454255'  
    And request 
    """
    { 
        "status": "inactive" 
    }
    """
    When method PUT
    Then status 200
    And match response.data.status == 'inactive'
    And print response

# Scenario: Validate update with missing mandatory fields
Scenario: Fail to update user due to missing mandatory fields
    Given path 'users', '7454255'  
    And request 
    """
    { 
        "name": ""  
    }
    """
    When method PUT
    Then status 422
    And match response.data[0].field == 'name'
    And match response.data[0].message == "can't be blank"
    And print response

# Scenario: Validate update with invalid email format
Scenario: Fail to update user with invalid email format
    Given path 'users', '7454255'  
    And request 
    """
    { 
        "email": "invalid-email-format" 
    }
    """
    When method PUT
    Then status 422
    And match response.data[0].field == 'email'
    And match response.data[0].message == "is invalid"
    And print response

# Scenario: Validate update for non-existing user
Scenario: Fail to update user details for a non-existing user
    Given path 'users', '9999999' 
    And request 
    """
    { 
        "name": "Some Name" 
    }
    """
    When method PUT
    Then status 404
    And match response.data.message == "Resource not found"
    And print response

# Scenario: Validate update without authorization token
Scenario: Fail to update user details without authorization token
    Given path 'users', '7454255'  
    * header Authorization = ''  
    And request 
    """
    { 
        "name": "Ankit Kumar" 
    }
    """
    When method PUT
    Then status 404
    And match response.data.message == "Resource not found"
    And print response
