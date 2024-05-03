@test-plan
Feature: test plan for REST queries

  Scenario: GET test case (simple)
    Given url 'https://reqres.in/api/users/2'
    # añadir headers
    When header ContentType = 'Application/json'
    #Config mas de un When sin escribirlo
    * configure connectTimeout = 120000
    * configure readTimeout = 120000
    When method GET
    And match response.data.first_name == 'Janet'
    # And match response.data.id == 2
    # And match response.data.first_name == '#string'
    Then status 200

  Scenario: POST test case (simple)
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

  @casoGET
    #ejemplo caso get si funciona parametrizado
  Scenario Outline: test case <nombreCaso>
    Given url 'https://reqres.in/api/users/<ID>'
    When header 'Content-Type' = 'Application/json'
    * configure connectTimeout = 120000
    * configure readTimeout = 120000
    When method GET
    Then status <estadoHTTP>
    Examples:
      | nombreCaso        | ID | estadoHTTP |
      | caso id 1         | 1  | 200        |
      | caso id 2         | 2  | 200        |
      | caso id 3         | 3  | 200        |
      | caso id not Found | 50 | 404        |

  @casoPost
    #ejemplo caso post si funciona
  Scenario Outline: test cases <nombreCaso2>
    Given url 'https://reqres.in/api/users'
    When request {"<name>": <Vname>,"<job>": <Vjob>}
    And method POST
    Then status 201
    Examples:
      | nombreCaso2    | name | Vname    | job | Vjob  |
      | name vacio     | name |          | job | "QA"  |
      | name nulo      | name | null     | job | "QA"  |
      | name 3 letras  | name | "ana"    | job | "QA"  |
      | sin campo name |      |          | job | "QA"  |
      | job vacio      | name | "jeremy" | job | ""    |
      | job nulo       | name | "jeremy" | job | null  |
      | job 3 letras   | name | "jeremy" | job | "QAs" |
      | sin campo job  | name | "jeremy" |     | ""    |


