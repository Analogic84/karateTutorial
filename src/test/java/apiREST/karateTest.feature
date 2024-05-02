Feature: test plan

  Scenario: GET test case
    Given url 'https://reqres.in/api/users/2'
    # añadir headers
    When header 'ContentType' = 'Application/json'
    #Config mas de un When sin escribirlo
    * configure connectTimeout = 120000
    * configure readTimeout = 120000
    When method GET
    And match response.data.first_name == 'Janet'
    # And match response.data.id == 2
    # And match response.data.first_name == '#string'
    Then status 200

  Scenario: POST test case
    Given url 'https://reqres.in/api/users'
    When request {"name": "morpheus","job": "leader"}
    And method POST
   # And match response.data.first_name == ''
    Then status 201

  Scenario: POST test case, case 2
    Given url 'https://reqres.in/api/users'
    When request
    # para Json mas grandes
    """
    {
    "name": "Ana",
    "job": "developer"
}
    """
    And method POST
    Then status 201


  Scenario: DELETE test case
    Given url 'https://reqres.in/api/users/3'
    When method DELETE
    Then status 204
