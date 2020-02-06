@GLOB-38
Feature: Create Assignment

##### Additional Properties#######
  @ALM_440953  @Positive @Story:GLP-61201 @Regression @Create-Assignment
  Scenario Outline: To Check If send Additional Properties Learning Experience created
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json"
      | description    | key                            | value                | 
      | Random value   | extensions.sectionId           | Dynamic              | 
      | key from excel | extends.sources[0]._id         | productId            | 
      | key from excel | extends.sources[0]._bssVer     | bssver               | 
      | key from excel | learningModel._id              | LearningModelid      | 
      | key from excel | learningModel._ver             | LearningModelver     | 
      | key from excel | extends.sources[0]._ver        | productVersion       | 
      | key to be add  | configuration                  | policyGroups-[REVEL] | 
      | key to be add  | extensions                     | productModel-SAET    | 
      | key to be add  | extends.sources[0]             | label-Label          | 
      | key to be add  | extends.sources[0]             | extensions-{}        | 
      | key to be add  | extends.sources[0].extensions  | value-value          | 
      | key to be add  | extends.sources[0]             | _links-{}            | 
      | key to be add  | extends.sources[0]._links      | self-{}              | 
      | key to be add  | extends.sources[0]._links.self | href-value           | 
  
     Then Server should return "201" Status for LE 
     Then I have the CouchBase response of query from "cluster1"
      
      And I should see following in the Couchbase response from "lec" as
      | Description            | key                                                      | value                      | 
      | label                  | label                                                    | <label>                    | 
      | extension.productModel | extensions.additionalProperties.productModel             | <extensions.productModel>  | 
      | extends.sources[0]     | extends.sources[0].additionalProperties.label            | <extends.sources[0].label> | 
      | extends.sources[0]     | extends.sources[0].additionalProperties.extensions.value | <extends.sources[0].value> | 
      | extends.sources[0]     | extends.sources[0]._links.self.href                      | <extends.sources[0].href>  | 
      And the Get LE data should be available in "LEC" in couchbase "cluster1" 
    Given Set the endpoint for GET LE Collection
     When User send the request to GET LE collection with "<sectionId>" and "<collectionDetails>"
     Then I should see additional properties in response from "lec"
      | Description            | key                                                      | value                      | 
      | label                  | label                                                    | <label>                    | 
      | extension.productModel | extensions.additionalProperties.productModel             | <extensions.productModel>  | 
      | extends.sources[0]     | extends.sources[0].additionalProperties.label            | <extends.sources[0].label> | 
      | extends.sources[0]     | extends.sources[0].additionalProperties.extensions.value | <extends.sources[0].value> | 
      | extends.sources[0]     | extends.sources[0]._links.self.href                      | <extends.sources[0].href>  | 
  
    Examples: 
      | label | extensions.productModel | extends.sources[0].label | extends.sources[0].value | extends.sources[0].href | sectionId | collectionDetails | 
      | REVEL | SAET                    | Label                    | value                    | value                   | System    | all               | 
  
  @ALM_440954  @Negative @Story:GLP-61201 @Regression @Create-Assignment
  Scenario: To Check Learning Experience is not created if link is not send as described in Schema for _links
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json"
      | description    | key                            | value                | 
      | Random value   | extensions.sectionId           | Dynamic              | 
      | key from excel | extends.sources[0]._id         | productId            | 
      | key from excel | extends.sources[0]._bssVer     | bssver               | 
      | key from excel | learningModel._id              | LearningModelid      | 
      | key from excel | learningModel._ver             | LearningModelver     | 
      | key from excel | extends.sources[0]._ver        | productVersion       | 
      | key to be add  | configuration                  | policyGroups-[REVEL] | 
      | key to be add  | extensions                     | productModel-SAET    | 
      | key to be add  | extends.sources[0]             | label-label          | 
      | key to be add  | extends.sources[0]             | extensions-{}        | 
      | key to be add  | extends.sources[0].extensions  | value-value          | 
      | key to be add  | extends.sources[0]             | _links-{}            | 
      | key to be add  | extends.sources[0]._links      | self-{}              | 
      | key to be add  | extends.sources[0]._links.self | href1-vivek          | 
  
     Then Server should return "400" Status for LE 
      And verify the error message as "Bad Request"
  
  @ALM_441192  @Negative @Story:GLP-61201 @Regression @Create-Assignment
  Scenario: To Check Learning Experience is not created if _link is sent as null
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json"
      | description    | key                            | value                | 
      | Random value   | extensions.sectionId           | Dynamic              | 
      | key from excel | extends.sources[0]._id         | productId            | 
      | key from excel | extends.sources[0]._bssVer     | bssver               | 
      | key from excel | learningModel._id              | LearningModelid      | 
      | key from excel | learningModel._ver             | LearningModelver     | 
      | key from excel | extends.sources[0]._ver        | productVersion       | 
      | key to be add  | configuration                  | policyGroups-[REVEL] | 
      | key to be add  | extensions                     | productModel-SAET    | 
      | key to be add  | extends.sources[0]             | label-Label          | 
      | key to be add  | extends.sources[0]             | extensions-{}        | 
      | key to be add  | extends.sources[0].extensions  | value-value          | 
      | key to be add  | extends.sources[0]             | _links-{}            | 
      | key to be add  | extends.sources[0]._links      | self-{"href":null}   | 
    Then Server should return "400" Status for LE 
    And verify the error message as "Bad Request"
 
 ########Stub-GET Assignment byID#########   
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
		
#############################################Stub Get LE by LEID with specific fields#####################################################
  
@Stub @ALM_427704 @Story:GLP-55502
Scenario: GLP-FSR-SAeT_ENG_EC_API contract_Get_Learning_ Experience_By_ID and fields_ValidateJsonSchema_TC001 
	Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_GET_Learning_Exp"
	When send the requests with "4eeac9bf-806a-4a3e-9cfd-c29b297f3612" and "fields" "configuration"
	Then verify the "200" code for get LE
	And Verify that configurations details are coming in the json response
	

 #############################################Stub Get Assignment#####################################################
  
@Stub @ALM_427705 @Story:GLP-55459
Scenario: GLP-FSR-SAeT_ENG_EC_API contract_Get_Learning_ Experience_By_ID and fields_ValidateJsonSchema_TC001 
	Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_GET_Learning_Exp"
	When send the requests with "32f42ce8-61dd-4bbc-bba5-1fdc03a0af9f"
	Then verify the "200" code for get LE
	And Verify that assetClass is "ASSIGNMENT" details are coming in the json response
	
	
################################################################Create Assignment################################################ 
 
 
 @ALM_425773 @Positive @Smoke @SchemaValidation @Regression @Story:GLP-53992 @Create-Assignment
   Scenario Outline: GLP-FSR-SAeT_ENG_EC_Handling Learning Model validation for Assignment_ValidLearningModel_PositiveTC001
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
    When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperienceAssignment" with "application/json"
      | description                    | key                     | value                           | 
      | key from excel                 | learningModel._id       | Assignment_LearningModelid      | 
      | key from excel                 | learningModel._ver      | Assignment_LearningModelver     | 
      | key from excel                 | learningModel._bssVer   | Assignment_LearningModelVersion |  
      | Id from create Course          | scope.assets[0]._id     | dynamic                         | 
      | version from create Course     | scope.assets[0]._ver    | dynamic                         | 
      | bss version from create Course | scope.assets[0]._bssVer | dynamic                         | 
  
    Then Server should return "201" Status for LE
    Then Schema should validate for POST LE
    Given Set the endpoint for GET LE Collection based on AssetClass & Scope Tags
	When User sends the request with "<assetClass>" and "<scope.assets._id>" and "<scope.assets._bssVer>" and "<collectionDetails>" to GET LE collection 
	And Validate LE status coming as PRE_COMPOSED
	And Verify the "<StatusCode>" code for GET LE collection based on AssetClass & Scope Tags
	And verify the assignment id present in response
     Examples: 
		| assetClass | scope.assets._id          | scope.assets._bssVer |collectionDetails         |StatusCode  |LEID  |
        | ASSIGNMENT | Dynamic1                  | Dynamic2             |  _created,language       |200         |System|
  
  @ALM_425774 @Negative @Regression @Story:GLP-53992 @Create-Assignment
  Scenario: GLP-FSR-SAeT_ENG_EC_Handling Learning Model validation for Assignment_InValidLearningModel_id _Negative_TC002
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json"
      | description    | key                        | value            | 
      | Random value   | extensions.sectionId       | Dynamic          | 
      | key from excel | extends.sources[0]._id     | productId        | 
      | key from excel | extends.sources[0]._bssVer | bssver           | 
      | key from excel | learningModel._id          | LearningModelid  | 
      | key from excel | learningModel._ver         | LearningModelver | 
      | key from excel | extends.sources[0]._ver    | productVersion   | 
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperienceAssignment" with "application/json"
      | description                    | key                     | value                                | 
      | key to be update               | learningModel._id       | 68757a5d-c6c0-4d38-991b-dbea95e1a18b | 
      | key from excel                 | learningModel._ver      | Assignment_LearningModelver          | 
      | key from excel                 | learningModel._bssVer   | Assignment_LearningModelVersion      | 
      | key to be add                  | configuration           | policyGroups-[REVEL]                 | 
      | Id from create Course          | scope.assets[0]._id     | dynamic                              | 
      | version from create Course     | scope.assets[0]._ver    | dynamic                              | 
      | bss version from create Course | scope.assets[0]._bssVer | dynamic                              | 
  
     Then Server should return "400" Status for LE 
     
  @ALM_425775 @Negative @Regression @Story:GLP-53992 @Create-Assignment
  Scenario: GLP-FSR-SAeT_ENG_EC_Handling Learning Model validation for Assignment_InValidLearningModel_bssver _Negative_TC003
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json"
      | description    | key                        | value            | 
      | Random value   | extensions.sectionId       | Dynamic          | 
      | key from excel | extends.sources[0]._id     | productId        | 
      | key from excel | extends.sources[0]._bssVer | bssver           | 
      | key from excel | learningModel._id          | LearningModelid  | 
      | key from excel | learningModel._ver         | LearningModelver | 
      | key from excel | extends.sources[0]._ver    | productVersion   | 
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperienceAssignment" with "application/json"
      | description                    | key                     | value                       | 
      | key from excel                 | learningModel._id       | Assignment_LearningModelid  | 
      | key from excel                 | learningModel._ver      | Assignment_LearningModelver | 
      | key to be update               | learningModel._bssVer   | uuid                        | 
      | key to be add                  | configuration           | policyGroups-[REVEL]        | 
      | Id from create Course          | scope.assets[0]._id     | dynamic                     | 
      | version from create Course     | scope.assets[0]._ver    | dynamic                     | 
      | bss version from create Course | scope.assets[0]._bssVer | dynamic                     | 
  
     Then Server should return "400" Status for LE   
     
  @ALM_425777 @Negative @Regression @Story:GLP-53992 @Create-Assignment
  Scenario: GLP-FSR-SAeT_ENG_EC_Handling Learning Model validation for Assignment_InValidLearningModel_ver _Negative_TC004
  
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json"
      | description    | key                        | value            | 
      | Random value   | extensions.sectionId       | Dynamic          | 
      | key from excel | extends.sources[0]._id     | productId        | 
      | key from excel | extends.sources[0]._bssVer | bssver           | 
      | key from excel | learningModel._id          | LearningModelid  | 
      | key from excel | learningModel._ver         | LearningModelver | 
      | key from excel | extends.sources[0]._ver    | productVersion   | 
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperienceAssignment" with "application/json"
      | description                    | key                     | value                           | 
      | key from excel                 | learningModel._id       | Assignment_LearningModelid      | 
      | key to be update               | learningModel._ver      | Assignment                      | 
      | key from excel                 | learningModel._bssVer   | Assignment_LearningModelVersion |  
      | Id from create Course          | scope.assets[0]._id     | dynamic                         | 
      | version from create Course     | scope.assets[0]._ver    | dynamic                         | 
      | bss version from create Course | scope.assets[0]._bssVer | dynamic                         | 
     Then Server should return "400" Status for LE 
     
  @ALM_425778 @Negative @Regression @Story:GLP-53992 @Create-Assignment
  Scenario: GLP-FSR-SAeT_ENG_EC_Handling Learning Model validation for Assignment_InValidLearningExperience_id _Negative_TC005
  
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json"
      | description    | key                        | value            | 
      | Random value   | extensions.sectionId       | Dynamic          | 
      | key from excel | extends.sources[0]._id     | productId        | 
      | key from excel | extends.sources[0]._bssVer | bssver           | 
      | key from excel | learningModel._id          | LearningModelid  | 
      | key from excel | learningModel._ver         | LearningModelver | 
      | key from excel | extends.sources[0]._ver    | productVersion   | 
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperienceAssignment" with "application/json"
      | description                    | key                     | value                           | 
      | key from excel                 | learningModel._id       | Assignment_LearningModelid      | 
      | key from excel                 | learningModel._ver      | Assignment_LearningModelver     | 
      | key from excel                 | learningModel._bssVer   | Assignment_LearningModelVersion | 
      | key to be add                  | configuration           | policyGroups-[REVEL]            | 
      | key to be update               | scope.assets[0]._id     | UUID                            | 
      | version from create Course     | scope.assets[0]._ver    | dynamic                         | 
      | bss version from create Course | scope.assets[0]._bssVer | dynamic                         | 
  
     Then Server should return "400" Status for LE 
     
  @ALM_425779 @Negative @Regression @Story:GLP-53992 @Create-Assignment
  Scenario: GLP-FSR-SAeT_ENG_EC_Handling Learning Model validation for Assignment_InValid_Resource_plan_Assignment_title_Negative_TC006
  
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json"
      | description    | key                        | value            | 
      | Random value   | extensions.sectionId       | Dynamic          | 
      | key from excel | extends.sources[0]._id     | productId        | 
      | key from excel | extends.sources[0]._bssVer | bssver           | 
      | key from excel | learningModel._id          | LearningModelid  | 
      | key from excel | learningModel._ver         | LearningModelver | 
      | key from excel | extends.sources[0]._ver    | productVersion   | 
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperienceAssignment" with "application/json"
      | description                    | key                         | value                           | 
      | key from excel                 | learningModel._id           | Assignment_LearningModelid      | 
      | key from excel                 | learningModel._ver          | Assignment_LearningModelver     | 
      | key from excel                 | learningModel._bssVer       | Assignment_LearningModelVersion | 
      | key to be add                  | configuration               | policyGroups-[REVEL]            | 
      | Id from create Course          | scope.assets[0]._id         | dynamic                         | 
      | version from create Course     | scope.assets[0]._ver        | dynamic                         | 
      | bss version from create Course | scope.assets[0]._bssVer     | dynamic                         | 
      | key to be update               | resourcePlan[0].resourceRef | ASSIGNMENTTITLE1                | 
     Then Server should return "400" Status for LE 
     
  @ALM_425780 @Negative @Regression @Story:GLP-53992 @Create-Assignment
  Scenario: GLP-FSR-SAeT_ENG_EC_Handling Learning Model validation for Assignment_InValid_Resource_plan_Student_message_Negative_TC007
  
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json"
      | description    | key                        | value            | 
      | Random value   | extensions.sectionId       | Dynamic          | 
      | key from excel | extends.sources[0]._id     | productId        | 
      | key from excel | extends.sources[0]._bssVer | bssver           | 
      | key from excel | learningModel._id          | LearningModelid  | 
      | key from excel | learningModel._ver         | LearningModelver | 
      | key from excel | extends.sources[0]._ver    | productVersion   | 
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperienceAssignment" with "application/json"
      | description                    | key                         | value                           | 
      | key from excel                 | learningModel._id           | Assignment_LearningModelid      | 
      | key from excel                 | learningModel._ver          | Assignment_LearningModelver     | 
      | key from excel                 | learningModel._bssVer       | Assignment_LearningModelVersion | 
      | key to be add                  | configuration               | policyGroups-[REVEL]            | 
      | Id from create Course          | scope.assets[0]._id         | dynamic                         | 
      | version from create Course     | scope.assets[0]._ver        | dynamic                         | 
      | bss version from create Course | scope.assets[0]._bssVer     | dynamic                         | 
      | key to be update               | resourcePlan[1].resourceRef | ASSIGNMENTTITLE1                | 
     Then Server should return "400" Status for LE 
     
 @ALM_425781 @Negative @Regression @Story:GLP-53992 @Create-Assignment
  Scenario: GLP-FSR-SAeT_ENG_EC_Handling Learning Model validation for Assignment_InValid_Resource_Assignment_title_Negative_TC008
  
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json"
      | description    | key                        | value            | 
      | Random value   | extensions.sectionId       | Dynamic          | 
      | key from excel | extends.sources[0]._id     | productId        | 
      | key from excel | extends.sources[0]._bssVer | bssver           | 
      | key from excel | learningModel._id          | LearningModelid  | 
      | key from excel | learningModel._ver         | LearningModelver | 
      | key from excel | extends.sources[0]._ver    | productVersion   | 
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperienceAssignment" with "application/json"
      | description                    | key                       | value                           | 
      | key from excel                 | learningModel._id         | Assignment_LearningModelid      | 
      | key from excel                 | learningModel._ver        | Assignment_LearningModelver     | 
      | key from excel                 | learningModel._bssVer     | Assignment_LearningModelVersion | 
      | key to be add                  | configuration             | policyGroups-[REVEL]            | 
      | Id from create Course          | scope.assets[0]._id       | dynamic                         | 
      | version from create Course     | scope.assets[0]._ver      | dynamic                         | 
      | bss version from create Course | scope.assets[0]._bssVer   | dynamic                         | 
      | key to be remove               | resources.ASSIGNMENTTITLE | dynamic                         | 
  
     Then Server should return "400" Status for LE 
     
  @ALM_425782 @Negative @Regression @Story:GLP-53992 @Create-Assignment
  Scenario: GLP-FSR-SAeT_ENG_EC_Handling Learning Model validation for Assignment_InValid_Resource_Student_message_Negative_TC009
  
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json"
      | description    | key                        | value            | 
      | Random value   | extensions.sectionId       | Dynamic          | 
      | key from excel | extends.sources[0]._id     | productId        | 
      | key from excel | extends.sources[0]._bssVer | bssver           | 
      | key from excel | learningModel._id          | LearningModelid  | 
      | key from excel | learningModel._ver         | LearningModelver | 
      | key from excel | extends.sources[0]._ver    | productVersion   | 
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperienceAssignment" with "application/json"
      | description                    | key                       | value                           | 
      | key from excel                 | learningModel._id         | Assignment_LearningModelid      | 
      | key from excel                 | learningModel._ver        | Assignment_LearningModelver     | 
      | key from excel                 | learningModel._bssVer     | Assignment_LearningModelVersion | 
      | key to be add                  | configuration             | policyGroups-[REVEL]            | 
      | Id from create Course          | scope.assets[0]._id       | dynamic                         | 
      | version from create Course     | scope.assets[0]._ver      | dynamic                         | 
      | bss version from create Course | scope.assets[0]._bssVer   | dynamic                         | 
      | Key to be remove               | resources.ASSIGNMENTTITLE | dyanmic                         | 
     Then Server should return "400" Status for LE 
     
  @ALM_426091 @Negative @Regression @Story:GLP-53992 @Create-Assignment
  Scenario: GLP-FSR-SAeT_ENG_EC_Handling Learning Model validation for Assignment_InValidLearningExperience_version _Negative_TC0011
  
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json"
      | description    | key                        | value            | 
      | Random value   | extensions.sectionId       | Dynamic          | 
      | key from excel | extends.sources[0]._id     | productId        | 
      | key from excel | extends.sources[0]._bssVer | bssver           | 
      | key from excel | learningModel._id          | LearningModelid  | 
      | key from excel | learningModel._ver         | LearningModelver | 
      | key from excel | extends.sources[0]._ver    | productVersion   | 
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperienceAssignment" with "application/json"
      | description                    | key                     | value                           | 
      | key from excel                 | learningModel._id       | Assignment_LearningModelid      | 
      | key from excel                 | learningModel._ver      | Assignment_LearningModelver     | 
      | key from excel                 | learningModel._bssVer   | Assignment_LearningModelVersion | 
      | key to be add                  | configuration           | policyGroups-[REVEL]            | 
      | Id from create Course          | scope.assets[0]._id     | dynamic                         | 
      | key to be update               | scope.assets[0]._ver    | uuid                            | 
      | bss version from create Course | scope.assets[0]._bssVer | dynamic                         | 
  
     Then Server should return "400" Status for LE 
     
  @ALM_426092 @Negative @Regression @Story:GLP-53992 @Create-Assignment
  Scenario: GLP-FSR-SAeT_ENG_EC_Handling Learning Model validation for Assignment_InValidLearningExperience_bss_version _Negative_TC0012
  
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json"
      | description    | key                        | value            | 
      | Random value   | extensions.sectionId       | Dynamic          | 
      | key from excel | extends.sources[0]._id     | productId        | 
      | key from excel | extends.sources[0]._bssVer | bssver           | 
      | key from excel | learningModel._id          | LearningModelid  | 
      | key from excel | learningModel._ver         | LearningModelver | 
      | key from excel | extends.sources[0]._ver    | productVersion   | 
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperienceAssignment" with "application/json"
      | description                | key                     | value                           | 
      | key from excel             | learningModel._id       | Assignment_LearningModelid      | 
      | key from excel             | learningModel._ver      | Assignment_LearningModelver     | 
      | key from excel             | learningModel._bssVer   | Assignment_LearningModelVersion | 
      | key to be add              | configuration           | policyGroups-[REVEL]            | 
      | Id from create Course      | scope.assets[0]._id     | dynamic                         | 
      | version from create Course | scope.assets[0]._ver    | dynamic                         | 
      | key to be update           | scope.assets[0]._bssVer | 900                             | 
  
     Then Server should return "400" Status for LE 
  
 
   @ALM_426092 @Negative @Regression @Story:GLP-53992 @Create-Assignment
  Scenario: GLP-FSR-SAeT_ENG_EC_Handling Learning Model validation for Assignment_with asset_type=Assignment _taking_Learning_model_of_course_NegativeTC013
  
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json"
      | description    | key                        | value            | 
      | Random value   | extensions.sectionId       | Dynamic          | 
      | key from excel | extends.sources[0]._id     | productId        | 
      | key from excel | extends.sources[0]._bssVer | bssver           | 
      | key from excel | learningModel._id          | LearningModelid  | 
      | key from excel | learningModel._ver         | LearningModelver | 
      | key from excel | extends.sources[0]._ver    | productVersion   | 
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
    When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperienceAssignment" with "application/json"
      | description                    | key                     | value                           | 
      | key from excel                 | learningModel._id       | Assignment_LearningModelid      | 
      | key from excel                 | learningModel._ver      | Assignment_LearningModelver     | 
      | key from excel                 | learningModel._bssVer   | Assignment_LearningModelVersion |  
      | Id from create Course          | scope.assets[0]._id     | dynamic                         | 
      | version from create Course     | scope.assets[0]._ver    | dynamic                         | 
      | bss version from create Course | scope.assets[0]._bssVer | dynamic                         | 
      | key to be update               |assetClass               | COURSE                          |
     Then Server should return "400" Status for LE 			