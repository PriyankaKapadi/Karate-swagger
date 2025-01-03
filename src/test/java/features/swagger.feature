Feature: This file contains all test cases related to Authors of Swagger.

Background:
* def requestdata =
"""{
   		"id": 700,
  		"idBook": 11,
  		"firstName": "My book",
  		"lastName": "Henry"
    }
"""

* def requestDataForIdAsZero = 
"""{
		  "id": 0,
  		"idBook": 11,
  		"firstName": "Mk Rao",
  		"lastName": "Lord"
		}
"""

* def requestDataForPutMethod = 
"""{
		  "id": 1,
  		"idBook": 16,
  		"firstName": "Akash",
  		"lastName": "Singh"
		}
"""

Scenario: To verify valid get Author
	
	Given url 'https://fakerestapi.azurewebsites.net/api/v1/Authors'
	When method GET
	Then status 200
	* def jsonResponse = response
	* print jsonResponse
	* def actual_firstname = jsonResponse[0].firstName
	* print actual_firstname
	* match actual_firstname == 'First Name 1'
	* def actual_lastname = jsonResponse[0].lastName
	* print actual_lastname
	* match actual_lastname == 'Last Name 1'
	* def actual_bookId = jsonResponse[0].idBook
	* print actual_bookId
	* match actual_bookId == 1

Scenario: To verify get Author by valid Id
	
	Given url 'https://fakerestapi.azurewebsites.net/api/v1/Authors/3'
	When method GET
	Then status 200
	* def jsonResponse = response
	* print jsonResponse
	* def actual_firstName = jsonResponse.firstName
	* print actual_firstName
	* match actual_firstName == 'First Name 3'
	* def actual_lastName = jsonResponse.lastName
	* print actual_lastName
	* match actual_lastName == 'Last Name 3'
	
Scenario: To verify get Author by invalid Id
	
	Given url 'https://fakerestapi.azurewebsites.net/api/v1/Authors/-90'
	When method GET
	Then status 404

Scenario: To verify get Authors by valid book Id
	
	Given url 'https://fakerestapi.azurewebsites.net/api/v1/Authors/authors/books/15'
	When method GET
	Then status 200
	* def jsonResponse = response
	* print response
	
Scenario: To verify post on Authors of swagger

	Given request requestdata
	And header Content-Type = 'application/json'
	And url 'https://fakerestapi.azurewebsites.net/api/v1/Authors'
	When method POST
	Then status 200
	* def jsonResponse = response
	* print jsonResponse
	* def bookId = jsonResponse.idBook
	* match bookId == 11
	* def firstName = jsonResponse.firstName
	* match firstName == 'My book'
	* def lastName = jsonResponse.lastName
	* match lastName == 'Henry'
	
Scenario: To verify post on Authors when Id is 0
	
	Given request requestDataForIdAsZero
	And header Content-Type = 'application/json'
	And url 'https://fakerestapi.azurewebsites.net/api/v1/Authors'
	When method POST
	Then status 200
	* def jsonResponse = response
	* print jsonResponse
	* def bookId = jsonResponse.idBook
	* match bookId == 11
	* def firstName = jsonResponse.firstName
	* match firstName == 'Mk Rao'
	* def lastName = jsonResponse.lastName
	* match lastName == 'Lord'

Scenario: To verify put on Authors by valid Id

	Given request requestDataForPutMethod
	And header Content-Type = 'application/json'
	And url 'https://fakerestapi.azurewebsites.net/api/v1/Authors/1'
	When method PUT
	Then status 200
	* def jsonResponse = response
	* print jsonResponse
	* def bookId = jsonResponse.idBook
	* match bookId == 16
	* def firstName = jsonResponse.firstName
	* match firstName == 'Akash'
	* def lastName = jsonResponse.lastName
	* match lastName == 'Singh'
	
Scenario: To verify delete on Authors

	Given url 'https://fakerestapi.azurewebsites.net/api/v1/Authors/20'
	When method Delete
	Then status 200
	