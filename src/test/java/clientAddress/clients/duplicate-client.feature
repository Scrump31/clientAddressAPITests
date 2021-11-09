Feature: Create Client
  Background:
    * def getClients = call read('get-clients.feature')
    * def clientList = getClients.response.clients
    * def getLastClient = clientList[clientList.length - 1]

  Scenario: A user cannot create a duplicate client
    Given url baseUrl
    And path 'add-client'
    And request getLastClient
    When method POST
    Then status 409
    And assert response.message == getLastClient.name + " is already in use"
