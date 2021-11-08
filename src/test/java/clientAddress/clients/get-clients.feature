Feature: Get Clients

  Scenario: A user can retrieve all clients
    Given url baseUrl
    And path 'clients'
    When method GET
    Then status 200
    And match each response.clients contains {name: '#string', email: '#string', address: '#string', phone: '#number', company: '#string', notes: '#string', id: '#string'}
    And print response

