@csv&json
Feature: csv test and json test
    #llamada archivo csv si funciona
  Scenario Outline: test case <nombreCaso2>
    Given url 'https://reqres.in/api/users'
    When request {"<name>": <Vname>,"<job>": <Vjob>}
    And method POST
    Then status 201
    Examples:
    #Lee el archivo csv
      |read('test.csv')|

  @casoPost
      #llamada archivo json si funciona
  Scenario Outline: read json test case <nombreCaso2>
    Given url 'https://reqres.in/api/users'
    When def body = read ('body.json')
    And request body
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
