Feature: Create Client

  Scenario: A user can create a client
    Given url baseUrl
    And path 'add-client'
    And request fakeUser
    When method POST
    Then status 200
    And assert response.message == fakeUser.name + " successfully added"

 
  Scenario: test fake user generator 
    * print fakeUser

