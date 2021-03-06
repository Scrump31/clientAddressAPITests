Feature: Update Client

  Background:
    * def getClients = call read('get-clients.feature')
    * def clientList = getClients.response.clients
    * def getLastClient = clientList[clientList.length - 1]
    * def newEmail = fakeUser.email

  Scenario: A user can update client data
    Given url baseUrl
    And path 'update-client'
    And getLastClient.email = newEmail
    And request getLastClient
    When method POST
    Then status 201
    And response.message == getLastClient.name + " successfully updated"
    * def id = getLastClient.id
    And call read('get-client.feature') {id: #(id)}
    Then response.email == newEmail
