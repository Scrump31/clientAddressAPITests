Feature: Delete Client

  Background:
    * def getClients = call read('get-clients.feature')
    * def clientList = getClients.response.clients
    * def getLastClient = clientList[clientList.length - 1]
    * def userId = getLastClient.id
    * def userName = getLastClient.name

  Scenario: A user can delete a client
    Given url baseUrl
    And path 'delete-client'
    And request { id: "#(userId)", name: "#(userName)" }
    When method DELETE
    Then status 200
    And response.message == getLastClient.name + " successfully deleted"
