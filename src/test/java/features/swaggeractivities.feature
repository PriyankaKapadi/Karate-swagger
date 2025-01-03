Feature: This file contains all test cases related to Activities of Swagger.

Background:

* def requestValidDataForPostMethod = 
"""{
        "id": 15,
        "title": "Activity 15",
        "dueDate": "2024-12-31T01:47:25.3420935+00:00",
        "completed": false
    }
"""

* def requestDataForPostMethodAsZero = 
"""{
  	"id": 0,
  	"title": "string",
  	"dueDate": "2024-12-30T09:52:01.228Z",
  	"completed": true
		}
"""

* def requestDataForPutMethod = 
"""{
    "id": 3,
    "title": "Activity 3",
    "dueDate": "2024-12-30T13:16:12.5507233+00:00",
    "completed": false
}
"""

* def requestDataForPutMethodAsZero = 
"""{
  	"id": 0,
  	"title": "string",
  	"dueDate": "2024-12-30T09:57:56.606Z",
  	"completed": true
		}
"""

* def requestDataForIdAsZero = 
"""{
  	"id": 0,
 	 	"title": "string",
  	"dueDate": "2024-12-30T09:52:01.228Z",
  	"completed": true
}
"""

Scenario: To verify valid get Activities
	
	Given url 'https://fakerestapi.azurewebsites.net/api/v1/Activities'
	When method GET
	Then status 200

Scenario: To verify put Activities by valid Id
	
	Given  request requestDataForPutMethod
	And header Content-Type = 'application/json'
	And url 'https://fakerestapi.azurewebsites.net/api/v1/Activities/3'
	When method PUT
	Then status 200
	* def jsonResponse = response
	* print jsonResponse
	* def id = jsonResponse.id
	* match id == 3
	* def title = jsonResponse.title
	* match title == 'Activity 3'
	
Scenario: To verify put Activities by valid Id is 0
	
	Given  request requestDataForPutMethodAsZero
	And header Content-Type = 'application/json'
	And url 'https://fakerestapi.azurewebsites.net/api/v1/Activities/0'
	When method PUT
	Then status 200
	* def jsonResponse = response
	* print jsonResponse
	* def id = jsonResponse.id
	* match id == 0
	* def title = jsonResponse.title
	* match title == 'string'
	
Scenario: To verify post Activities when Id is 0
	
	Given request requestDataForPostMethodAsZero
	And header Content-Type = 'application/json'
	And url 'https://fakerestapi.azurewebsites.net/api/v1/Activities'
	When method POST
	Then status 200
	* def jsonResponse = response
	* print jsonResponse
	* def Id = jsonResponse.id
	* match Id == 0
	* def title = jsonResponse.title
	* match title == 'string'
	
Scenario: To verify post Activities by valid Id

	Given request requestValidDataForPostMethod
	And header Content-Type = 'application/json'
	And url 'https://fakerestapi.azurewebsites.net/api/v1/Activities'
	When method POST
	Then status 200
	* def jsonResponse = response
	* print jsonResponse
	* def Id = jsonResponse.id
	* match Id == 15
	* def title = jsonResponse.title
	* match title == 'Activity 15'

Scenario: To verify get Activities by valid Id
	
	Given url 'https://fakerestapi.azurewebsites.net/api/v1/Activities/9'
	When method GET
	Then status 200
	* def jsonResponse = response
	* print jsonResponse
	* def Id = jsonResponse.id
	* print Id
	* match Id == 9
	* def title = jsonResponse.title
	* print title
	* match title == 'Activity 9'
	
Scenario: To verify get Activities by invalid Id
	
	Given url 'https://fakerestapi.azurewebsites.net/api/v1/Activities/-9'
	When method GET
	Then status 404
		
Scenario: To verify delete on Activities

	Given url 'https://fakerestapi.azurewebsites.net/api/v1/Activities/11'
	When method Delete
	Then status 200	

