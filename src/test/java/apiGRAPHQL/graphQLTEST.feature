@graphQLTEST

Feature: test plan associated with query graphQL
  #query graphQL si funciona lectura archivo txt
  Scenario: query test case

    Given url 'https://rickandmortyapi.com/graphql'
#    When def query = read ('testGRAPH.txt')
    When text query =
    """
    query {
  character(id: 2)
  {
    name,
    status,
    species,
    gender
  }
}
    """
    And request {query : '#(query)'}
    And method POST
    And match response.data.character.gender == 'Male'
    Then status 200


    #query graphQL si funciona lectura archivo txt caso parametrizado
  Scenario Outline: body calls test case <nombreCaso>

    Given url 'https://rickandmortyapi.com/graphql'
    When text query =
    """
    query {
  character(id: <numero>)
  {
    name,
    status,
    species,
    gender
  }
}
    """
    And request {query : '#(query)'}
    And method POST
    Then status 200
    Examples:
      | nombreCaso   | numero |
      | caso normal  | 2      |
      | genero id 13 | 13     |
      | genero id 3  | 3      |
      | genero id 40 | 40     |
      | genero id 10 | 10     |

    #query graphQL si funciona lectura archivo txt parametrizado
  Scenario Outline: body calls test case read txt <nombreCaso>

    Given url 'https://rickandmortyapi.com/graphql'
    When def query = read ('testGRAPH.txt')
    And replace query.num = <num>
    And request {query : '#(query)'}
    And method POST
    Then status 200
    Examples:
      | nombreCaso   | num |
      | caso normal  | 2   |
      | genero id 13 | 13  |
      | genero id 3  | 3   |
      | genero id 40 | 40  |
      | genero id 10 | 10  |

