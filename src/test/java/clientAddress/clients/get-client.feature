Feature: Get Client

Background:
  * def getClients = call read('get-clients.feature')
  * def clientList = getClients.response.clients
  * def getLastClient = clientList[clientList.length - 1]
Scenario: A user can get a single client
  Given url baseUrl
  And path 'get-client'
  And params {id: #(id)}
  When method GET
  Then status 200
