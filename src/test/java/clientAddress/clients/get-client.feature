Feature: Get Client

  Background:
    * def getClients = call read('get-clients.feature')
    * def clientList = getClients.response.clients
    * def getLastClient = clientList[clientList.length - 1]

  Scenario: A user can get a single client
    Given url baseUrl
    And path 'edit-client'
    And param id = getLastClient.id
    When method GET
    Then status 200
