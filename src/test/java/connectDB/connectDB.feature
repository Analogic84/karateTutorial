Feature: connect DB

  Background:
    #conexion a base de datos mySQL y lectura de datos requisito de levantar una DB y saber nombre de DB
    * def config = {username: 'root' , password: '', url:'jdbc:mysQL://localhost:3306/registros' , driverClassName:'com.mysql.cj.jdbc.Driver' }
    * def DBUtils = Java.type('connectDB.DbUtils')
    * def db = new DBUtils(config)

  Scenario: reading db values
    * def usuario = db.readRows('SELECT * FROM usuarios')
    Then print 'usuario--' ,usuario