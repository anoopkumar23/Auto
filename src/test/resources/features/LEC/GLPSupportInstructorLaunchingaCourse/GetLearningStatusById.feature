@GLOB-6
@Story:GLP-48010 @Story:GLP-48962
Feature: As a Tester I want to Validate the Get Fetching the Learning Experience State 

@ALM_410730 @SchemaValidation  
Scenario Outline:Validate the Json Schema for GET Fetching the Learning Experience State 
Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json"
      | description    | key                        | value            |
      | Random value   | extensions.sectionId       | Dynamic          | 
      | key from excel | extends.sources[0]._id     | productId        | 
      | key from excel | extends.sources[0]._bssVer | bssver           | 
      | key from excel | learningModel._id          | LearningModelid  | 
      | key from excel | learningModel._ver         | LearningModelver | 
      | key from excel | extends.sources[0]._ver    | productVersion   | 
	Given set the endpoint for GET Fetching the Learning Experience State 
	When send the request with "<LEID>" for Fetching the Learning Experience State with "<Method>" 
	Then Schema should validated for GET Fetching the Learning Experience State 
	Examples: 
		| LEID   | Status |Method|
		| System | 200    |GET   |
		
		
		
@ALM_410727 @ALM_410728 @ALM_410725 @Smoke @Postive @Regression
Scenario Outline:To Get Fetching the Learning Experience State for positive data
Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json"
      | description    | key                        | value            |
      | Random value   | extensions.sectionId       | Dynamic          | 
      | key from excel | extends.sources[0]._id     | productId        | 
      | key from excel | extends.sources[0]._bssVer | bssver           | 
      | key from excel | learningModel._id          | LearningModelid  | 
      | key from excel | learningModel._ver         | LearningModelver | 
      | key from excel | extends.sources[0]._ver    | productVersion   |  
Given set the endpoint for GET Fetching the Learning Experience State 
When send the request with "<LEID>" for Fetching the Learning Experience State with "<Method>" 
And verify the "<Status>" code for Fetching the Learning Experience State 
			
Examples: 
				| LEID   | Status |Method|
				| System | 200    |GET   |
				
				
				
				
				
@ALM_410726 @ALM_426082 @Negative @Regression
Scenario Outline:To Get Fetching the Learning Experience State for negative data 
Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json"
      | description    | key                        | value            |
      | Random value   | extensions.sectionId       | Dynamic          | 
      | key from excel | extends.sources[0]._id     | productId        | 
      | key from excel | extends.sources[0]._bssVer | bssver           | 
      | key from excel | learningModel._id          | LearningModelid  | 
      | key from excel | learningModel._ver         | LearningModelver | 
      | key from excel | extends.sources[0]._ver    | productVersion   | 
Given set the endpoint for GET Fetching the Learning Experience State 
When send the request with "<LEID>" for Fetching the Learning Experience State with "<Method>"
And verify the "<Status>" code for Fetching the Learning Experience State
And Verify the "<errorMessage>" in response
Examples: 
						| LEID                                 | Status | Method| errorMessage                  |
						| null                                 | 400    | GET   | Bad Request               |
						| 83a484d5-80de-418b-894c-f46f9f878999 | 404    | GET   | Learning Experience Not Found.|
						| 83a484d5-80de-418b-894c-f@6f9f87899$ | 400    | GET   | Bad Request               |
						| System                               | 405    | POST  | Method not Allowed            |
						
						
						
