Feature: This file contains all test cases related to Books of Swagger.

Background:

* def requestdata = 
"""{
	  "id": 800,
	  "title": "Book 800",
	  "description": "My book",
	  "pageCount": 10500,
	  "excerpt": "string",
	  "publishDate": "2024-12-30T08:10:43.739Z"
	 }
"""

* def requestDataForPutMethod = 
"""{
		"id":900,
		"title":"Book 900",
		"description":"My book name is India",
		"pageCount":1001,
		"excerpt":"string",
		"publishDate":"2024-12-30T08:10:43.739Z"
	 }
"""

Scenario: To verify valid get books
	
	Given url 'https://fakerestapi.azurewebsites.net/api/v1/Books'
	When method GET
	Then status 200
	* def jsonResponse = response
	* print jsonResponse
	* def actual_title = jsonResponse[0].title
	* print actual_title
	* match actual_title == 'Book 1'
	* def actual_description = jsonResponse[0].description
	* print actual_description
	* match actual_description == 'Lorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\n'
	* def actual_pageCount = jsonResponse[0].pageCount
	* print actual_pageCount
	* match actual_pageCount == 100
	
Scenario: To verify get Books by valid Id
	
	Given url 'https://fakerestapi.azurewebsites.net/api/v1/Books/3'
	When method GET
	Then status 200
	* def jsonResponse = response
	* print jsonResponse
	* def actual_title = jsonResponse.title
	* print actual_title
	* match actual_title == 'Book 3'
	* def actual_pageCount = jsonResponse.pageCount
	* print actual_pageCount
	* match actual_pageCount == 300
	
Scenario: To verify get Books by invalid Id
	
	Given url 'https://fakerestapi.azurewebsites.net/api/v1/Books/-3'
	When method GET
	Then status 404
	
Scenario: To verify post on Books of swagger

	Given request requestdata
	And header Content-Type = 'application/json'
	And url 'https://fakerestapi.azurewebsites.net/api/v1/Books'
	When method POST
	Then status 200
	* def jsonResponse = response
	* print jsonResponse
	* def title = jsonResponse.title
	* match title == 'Book 800'
	* def description = jsonResponse.description
	* match description == 'My book'
	* def pageCount = jsonResponse.pageCount
	* match pageCount == 10500
	
Scenario: To verify put on Books by valid Id

	Given request requestDataForPutMethod
	And header Content-Type = 'application/json'
	And url 'https://fakerestapi.azurewebsites.net/api/v1/Books/1'
	When method PUT
	Then status 200
	* def jsonResponse = response
	* print jsonResponse
	* def title = jsonResponse.title
	* match title == 'Book 900'
	* def description = jsonResponse.description
	* match description == 'My book name is India'
	* def pageCount = jsonResponse.pageCount
	* match pageCount == 1001
	
Scenario: To verify delete on Books

	Given url 'https://fakerestapi.azurewebsites.net/api/v1/Books/1'
	When method Delete
	Then status 200
	

	
	

	