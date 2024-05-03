@Token
Feature: getToken

  @getToken
     #test a modo de visualizacion feature no funciona
  Scenario: get token for
    * configure connectTimeout = 120000
    * configure readTimeout = 120000
    * url 'https://seguridad.test.uat.cl'
    * header Content-Type = 'application/x-www-form-urlencode'
    * form field gran_type = 'password'
    * form field client_id = 'ID'
    * form field client_secret = 'secret'
    * form field usermane = 'user'
    * form field password = 'password'
    * method POST
    * status 200
    * match responseType == 'json'
