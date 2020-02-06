@GLOB-6
Feature: GLP Support Instructor launching a course

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
		
@Story:GLP-52912 @ALM_421527 @Negative @Regression
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