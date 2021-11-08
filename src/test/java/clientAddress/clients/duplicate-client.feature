Feature: Create Client

  Scenario: A user cannot create a duplicate client
    Given url baseUrl
    And path 'add-client'
    And def getClients = call read('get-clients.feature')
    And def clientList = getClients.response.clients
    And def getLastClient = clientList[clientList.length - 1]
    And request getLastClient
    When method POST
    Then status 409
    And assert response.message == getLastClient.name + " is already in use"
