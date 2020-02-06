@GLOB-7
Feature: As a Tester I want to Validate the Get Learning Exp & Implement GET LearningExperience function to support Create Assignment & API Contract of Enhanced version Get Learning Experience by Learning Experience ID to support Query parameter filtering
 
@Story:GLP-46566 @ALM_409604 @SchemaValidation @Story:GLP-47109 @Story:GLP-48086
 Scenario Outline: Validate the Json Schema for GET Learning exp 
	Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json"
      | description    | key                        | value            |
      | Random value   | extensions.sectionId       | Dynamic          | 
      | key from excel | extends.sources[0]._id     | productId        | 
      | key from excel | extends.sources[0]._bssVer | bssver           | 
      | key from excel | learningModel._id          | LearningModelid  | 
      | key from excel | learningModel._ver         | LearningModelver | 
      | key from excel | extends.sources[0]._ver    | productVersion   | 
    
	Given set the endpoint for GET LE contract 
	When send the request with "<LEID>"
	Then Schema should validated for GET LE contract 
	Examples: 
		| LEID   | Status | 
		| System | 200    | 

@Story:GLP-46566 @ALM_401616 @ALM_403259 @Positive @Smoke @Regression @Story:GLP-47109 @Story:GLP-48086
Scenario Outline: To Get Learning Experience for postive data 
	Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json"
      | description    | key                        | value            |
      | Random value   | extensions.sectionId       | Dynamic          | 
      | key from excel | extends.sources[0]._id     | productId        | 
      | key from excel | extends.sources[0]._bssVer | bssver           | 
      | key from excel | learningModel._id          | LearningModelid  | 
      | key from excel | learningModel._ver         | LearningModelver | 
      | key from excel | extends.sources[0]._ver    | productVersion   | 
	Given set the endpoint for GET LE contract 
	When send the request with "<LEID>" 
	And verify the "<Status>" code for get LE
	Examples: 
		| LEID   | Status | 
		| System | 200    |  



 @Story:GLP-46566 @ALM_401618 @ALM_401620 @ALM_401619	@Negative @Regression @Story:GLP-47109 @Story:GLP-48086
Scenario Outline: To Get Learning Experience for negative data 
	Given set the endpoint for GET LE contract 
	When send the request with "<LEID>" 
	And verify the "<Status>" code for get LE 
	And Verify the "<errorMessage>" message in response
	Examples: 
		| LEID                                  | Status | errorMessage                |
		| null                                  | 400    | Bad Request             |
     	| 83a484d5-80de-418b-894c-f46f9f878999  | 404    | Invalid LearningExperienceId|
     	| 83a484d5-80de-418b-894c-f@6f9f87899$  | 400    | Bad Request             |
		

@Story:GLP-46566 @Negative @ALM_426078 @Regression @Story:GLP-47109 @Story:GLP-48086	
	Scenario: To verify Method not allowed 405 for Get Learning Experience by Id
	Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json"
      | description    | key                        | value            |
      | Random value   | extensions.sectionId       | Dynamic          | 
      | key from excel | extends.sources[0]._id     | productId        | 
      | key from excel | extends.sources[0]._bssVer | bssver           | 
      | key from excel | learningModel._id          | LearningModelid  | 
      | key from excel | learningModel._ver         | LearningModelver | 
      | key from excel | extends.sources[0]._ver    | productVersion   | 
	Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_GET_Learning_Exp_Fxn"
	When I send the "POST" request to "DomainURL/ENDPOINT_LEC_GET_Learning_Exp_Fxn" using request body as "updateStatus" with "application/json" and "leid"
	| description    | key                        | value            |
	Then Server should return "405" Status for LE     	
		
@Story:GLP-52910 @Stub @ALM_421482
Scenario Outline: Get Learning Experience to support create assignment using bssver and configuration
Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json"
      | description    | key                        | value            |
      | Random value   | extensions.sectionId       | Dynamic          | 
      | key from excel | extends.sources[0]._id     | productId        | 
      | key from excel | extends.sources[0]._bssVer | bssver           | 
      | key from excel | learningModel._id          | LearningModelid  | 
      | key from excel | learningModel._ver         | LearningModelver | 
      | key from excel | extends.sources[0]._ver    | productVersion   | 
	Given set the endpoint for GET LEC
	When send the requests with "<bssver>" and "<fields>" and "<LEID>"
	And Verify that json response contains the columns passed in fields filter contract
	And verify the "<Status>" code for get LE
	Examples: 
	   |LEID   | bssver|Status|fields        |
	   |System |  1    | 200  | configuration|

@Story:GLP-52910 @Stub @ALM_422015		
Scenario Outline: Get Learning Experience to support create assignment to verify 404 using invalid bssver

Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json"
      | description    | key                        | value            |
      | Random value   | extensions.sectionId       | Dynamic          | 
      | key from excel | extends.sources[0]._id     | productId        | 
      | key from excel | extends.sources[0]._bssVer | bssver           | 
      | key from excel | learningModel._id          | LearningModelid  | 
      | key from excel | learningModel._ver         | LearningModelver | 
      | key from excel | extends.sources[0]._ver    | productVersion   | 
	Given set the endpoint for GET LEC 
	When send the requests with "<bssver>" and "<fields>" and "<LEID>"
	And verify the "<Status>" code for get LE
	Examples: 
		| LEID   | Status | bssver|fields|
		| System | 404    |  -1   |configuration|


@Story:GLP-52912 @ALM_421523 @Positive @Smoke @Regression
Scenario Outline: Get Learning Experience to support create assignment with valid query params
Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json"
      | description    | key                        | value            |
      | Random value   | extensions.sectionId       | Dynamic          | 
      | key from excel | extends.sources[0]._id     | productId        | 
      | key from excel | extends.sources[0]._bssVer | bssver           | 
      | key from excel | learningModel._id          | LearningModelid  | 
      | key from excel | learningModel._ver         | LearningModelver | 
      | key from excel | extends.sources[0]._ver    | productVersion   | 
	Given set the endpoint for GET LEC function 
	When send the requests with "<bssver>" and "<fields>" and "<LEID>"
	And Verify that json response contains the columns passed in fields filter
	And verify the "<Status>" code for get LE
	Examples: 
	   |LEID   | bssver|Status|fields        |
	   |System |  1    | 200  | configuration,constraints,scope,learningModel,resources,extensions,resourcePlan|
		
@Story:GLP-52912 @ALM_421524	@Negative @Regression
Scenario Outline: Get Learning Experience to support create assignment using invalid bssver

Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json"
      | description    | key                        | value            |
      | Random value   | extensions.sectionId       | Dynamic          | 
      | key from excel | extends.sources[0]._id     | productId        | 
      | key from excel | extends.sources[0]._bssVer | bssver           | 
      | key from excel | learningModel._id          | LearningModelid  | 
      | key from excel | learningModel._ver         | LearningModelver | 
      | key from excel | extends.sources[0]._ver    | productVersion   | 
	Given set the endpoint for GET LEC function 
	When send the requests with "<bssver>" and "<fields>" and "<LEID>"
	And verify the "<Status>" code for get LE
	Examples: 
		| LEID   | Status | bssver|fields|
		| System | 404   |  101   |configuration|


		
 @Story:GLP-52912 @ALM_421525	@Positive @Smoke @Regression
Scenario Outline: Get Learning Experience to support create assignment using only bssver

Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json"
      | description    | key                        | value            |
      | Random value   | extensions.sectionId       | Dynamic          | 
      | key from excel | extends.sources[0]._id     | productId        | 
      | key from excel | extends.sources[0]._bssVer | bssver           | 
      | key from excel | learningModel._id          | LearningModelid  | 
      | key from excel | learningModel._ver         | LearningModelver | 
      | key from excel | extends.sources[0]._ver    | productVersion   | 
	Given set the endpoint for GET LEC function 
	When send the requests with "<bssver>" and "<LEID>"
	And verify the "<Status>" code for get LE
	Examples: 
		| LEID   | Status | bssver|
		| System | 200    |  1    |
		

@Story:GLP-52912 @ALM_421526	@Negative @Regression
Scenario Outline: Get Learning Experience to support create assignment using null value for bssver

Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json"
      | description    | key                        | value            |
      | Random value   | extensions.sectionId       | Dynamic          | 
      | key from excel | extends.sources[0]._id     | productId        | 
      | key from excel | extends.sources[0]._bssVer | bssver           | 
      | key from excel | learningModel._id          | LearningModelid  | 
      | key from excel | learningModel._ver         | LearningModelver | 
      | key from excel | extends.sources[0]._ver    | productVersion   | 
	Given set the endpoint for GET LEC function 
	When send the requests with "<bssver>" and "<fields>" and "<LEID>"
	And verify the "<Status>" code for get LE
	Examples: 
		| LEID   | Status | bssver|fields       |
		| System | 400    |  null |configuration|		
		
@Story:GLP-52912 @ALM_421527	 @Negative  @Regression
Scenario Outline: Get Learning Experience to support create assignment using invalid learner Id
Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json"
      | description    | key                        | value            |
      | Random value   | extensions.sectionId       | Dynamic          | 
      | key from excel | extends.sources[0]._id     | productId        | 
      | key from excel | extends.sources[0]._bssVer | bssver           | 
      | key from excel | learningModel._id          | LearningModelid  | 
      | key from excel | learningModel._ver         | LearningModelver | 
      | key from excel | extends.sources[0]._ver    | productVersion   | 
	Given set the endpoint for GET LEC function 
	When send the requests with "<bssver>" and "<fields>" and "<LEID>"
    And verify the "<Status>" code for get LE
	Examples: 
	   |LEID                                 | bssver|Status|fields       |
	   |28a3a03e-27de-420b-a05b-531116640dc7 |  1    | 404 | configuration|
	   
 
	
	
	
	
	 
	   
	   
	   
	   