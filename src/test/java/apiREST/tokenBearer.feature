Feature: token basic and bearer

  Scenario: bearer token
    Given url 'https://api.github.com/user/repos'
    When header Authorization = 'Bearer añadir tu token de git'
    And method GET
    Then status 200
    * def valores = response[0].name
