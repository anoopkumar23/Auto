@GLOB-7
@Story:GLP-45015 @Story:GLP-47109 @Story:GLP-47259 @Story:GLP-51544 @Story:GLP-45016 @Story:GLP-53992 @Story:GLP-54754
Feature: As a Tester I want to Validate the POST Learning Exp working as expected with all the validations defined in the learning model 

@ALM_420411 @SchemaValidation @Story:GLP-60810
  Scenario: Validate the Json Schema for POST Learning exp 
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json"
      | description    | key                        | value            |
      | Random value   | extensions.sectionId       | Dynamic          | 
      | key from excel | extends.sources[0]._id     | productId        | 
      | key from excel | extends.sources[0]._bssVer | bssver           | 
      | key from excel | learningModel._id          | LearningModelid  | 
      | key from excel | learningModel._ver         | LearningModelver | 
      | key from excel | extends.sources[0]._ver    | productVersion   | 
     Then Schema should validate for POST LE 

  
  @ALM_417587 @ALM_419870 @Positive @Smoke @ALM_417587 @ALM_424518 @ALM_424516 @ALM_401588 @Story:GLP-55795 @Couchbase @Regression @Story:GLP-60810
  Scenario Outline: To Post Learning Experience for postive data with sending all mandotry field 
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json"
      | description    | key                        | value                | 
      | Random value   | extensions.sectionId       | Dynamic              | 
      | key from excel | extends.sources[0]._id     | productId            | 
      | key from excel | extends.sources[0]._bssVer | bssver               | 
      | key from excel | learningModel._id          | LearningModelid      | 
      | key from excel | learningModel._ver         | LearningModelver     | 
      | key from excel | extends.sources[0]._ver    | productVersion       | 
      | key to be add  | configuration              | policyGroups-[REVEL] | 
  
Then Server should return "201" Status for LE 

Then I have the CouchBase response of query from "cluster1"
      
      And I should see following in the Couchbase response from "lec" as
      | Description            | key                                             | value    | 
      | label                  | label                                           | <label>  | 
      |_status                 |_status                                          |<_status> |
   Examples: 
      | label | _status       |
      | REVEL | PRE_COMPOSED  | 
  
  @ALM_419879 @ALM_419871 @Positive @Smoke @Story:GLP-55795 @Regression @Story:GLP-60810
  Scenario: To Post Learning Experience for postive data with sending with non-mandatory fields blank
  
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json"
      | description      | key                        | value            | 
      | Random value     | extensions.sectionId       | Dynamic          | 
      | key from excel   | extends.sources[0]._id     | productId        | 
      | key from excel   | extends.sources[0]._bssVer | bssver           | 
      | key from excel   | learningModel._id          | LearningModelid  | 
      | key from excel   | learningModel._ver         | LearningModelver | 
      | key from excel   | extends.sources[0]._ver    | productVersion   | 
      | key to be update | label                      |                  | 
  
Then Server should return "201" Status for LE  

@ALM_417588 @Negative @ALM_419872 @Regression @Story:GLP-60810
Scenario: GLP-FSR-SAeT_ENG_EC_POST _LearningExperience_LearningModelValidation_Negative_scenarios_TC002
  
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json"
      | description      | key                        | value            | 
      | Random value     | extensions.sectionId       | Dynamic          | 
      | key from excel   | extends.sources[0]._id     | productId        | 
      | key from excel   | extends.sources[0]._bssVer | bssver           | 
      | key to be update | learningModel._id          | 60198945-7cf3-4e57-b966-fce64588cf80  | 
      | key from excel   | learningModel._ver         | LearningModelver | 
      | key from excel   | extends.sources[0]._ver    | productVersion   | 
      | key to be update | label                      |                  | 
  
Then Server should return "400" Status for LE  

And verify the error message as "Bad Request"

@ALM_401593 @Negative @Regression
  Scenario: GLP-FSR-SAeT_ENG_EC_PostLearningExperience_withmandatoryfield as NULL__TC004
  
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json"
      | description      | key                        | value            | 
      | Random value     | extensions.sectionId       | Dynamic          | 
      | key from excel   | extends.sources[0]._id     | productId        | 
      | key from excel   | extends.sources[0]._bssVer | bssver           | 
      | key from excel   | learningModel._id          | LearningModelid  | 
      | key from excel   | learningModel._ver         | LearningModelver | 
      | key from excel   | extends.sources[0]._ver    | productVersion   | 
      | key to be update | label                      |                  | 
      | key to be update | resources.COURSETITLE._resourceType           |     NULL             | 
 Then Server should return "400" Status for LE 
  
  

  
  @Negative @ALM_419872 @ALM_419873 @Regression
  Scenario: To Post Learning Experience for invalid Mandatory field
  
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json"
      | description      | key                        | value            | 
      | Random value     | extensions.sectionId       | Dynamic          | 
      | key from excel   | extends.sources[0]._id     | productId        | 
      | key from excel   | extends.sources[0]._bssVer | bssver           | 
      | key to be update | learningModel._id          | LearningModelid  | 
      | key from excel   | learningModel._ver         | LearningModelver | 
      | key from excel   | extends.sources[0]._ver    | productVersion   | 
     Then Server should return "400" Status for LE 

  
  @Negative @ALM_420397  @Story:GLP-55795 	@Regression @Story:GLP-60810
  Scenario: To Post Learning Experience for Invalid enum
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json"
      | description      | key                         | value            | 
      | Random value     | extensions.sectionId        | Dynamic          | 
      | key from excel   | extends.sources[0]._id      | productId        | 
      | key from excel   | extends.sources[0]._bssVer  | bssver           | 
      | key from excel   | learningModel._id           | LearningModelid  | 
      | key from excel   | learningModel._ver          | LearningModelver | 
      | key from excel   | extends.sources[0]._ver     | productVersion   | 
      |key to be update|resources.COURSETITLE._resourceType|CONTENT|
     Then Server should return "400" Status for LE 

  
  @ALM_424519 @Negative @Regression
  Scenario: To Post Learning Experience for invalid sources Product ID
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json"
      | description      | key                        | value            | 
      | Random value     | extensions.sectionId       | Dynamic          | 
      | key to be update | extends.sources[0]._id     | productId        | 
      | key from excel   | extends.sources[0]._bssVer | bssver           | 
      | key from excel   | learningModel._id          | LearningModelid  | 
      | key from excel   | learningModel._ver         | LearningModelver | 
      | key from excel   | extends.sources[0]._ver    | productVersion   | 
     Then Server should return "400" Status for LE 

  
   @ALM_424523  @ALM_424520 @Neagtive @Regression
  Scenario: To Post Learning Experience for invalid sources Version
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json"
      | description      | key                        | value            | 
      | Random value     | extensions.sectionId       | Dynamic          | 
      | key from excel   | extends.sources[0]._id     | productId        | 
      | key from excel   | extends.sources[0]._bssVer | bssver           | 
      | key from excel   | learningModel._id          | LearningModelid  | 
      | key from excel   | learningModel._ver         | LearningModelver | 
      | key to be update | extends.sources[0]._ver    | productVersion   | 
     Then Server should return "400" Status for LE 

  
  @ALM_424522  @Negative @Regression
  Scenario: To Post Learning Experience for invalid sources doc type
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json"
      | description      | key                         | value            | 
      | Random value     | extensions.sectionId        | Dynamic          | 
      | key from excel   | extends.sources[0]._id      | productId        | 
      | key from excel   | extends.sources[0]._bssVer  | bssver           | 
      | key from excel   | learningModel._id           | LearningModelid  | 
      | key from excel   | learningModel._ver          | LearningModelver | 
      | key from excel   | extends.sources[0]._ver     | productVersion   | 
      | key to be update | extends.sources[0]._docType | productVersion   | 
     Then Server should return "400" Status for LE 
  

  
  @ALM_424521  @Negative  @Regression
  Scenario: To Post Learning Experience for invalid sources asset-type
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json"
      | description      | key                           | value            | 
      | Random value     | extensions.sectionId          | Dynamic          | 
      | key from excel   | extends.sources[0]._id        | productId        | 
      | key from excel   | extends.sources[0]._bssVer    | bssver           | 
      | key from excel   | learningModel._id             | LearningModelid  | 
      | key from excel   | learningModel._ver            | LearningModelver | 
      | key from excel   | extends.sources[0]._ver       | productVersion   | 
      | key to be update | extends.sources[0]._assetType | productVersion   | 
     Then Server should return "400" Status for LE
   
  
  @ALM_424524 @Negative @Regression
  Scenario: Verify that create LEC is not working with the configuration defined in LPB and Content type-Apllication/xml 
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/xml"
      | description      | key                           | value            | 
      | Random value     | extensions.sectionId          | Dynamic          | 
      | key from excel   | extends.sources[0]._id        | productId        | 
      | key from excel   | extends.sources[0]._bssVer    | bssver           | 
      | key from excel   | learningModel._id             | LearningModelid  | 
      | key from excel   | learningModel._ver            | LearningModelver | 
      | key from excel   | extends.sources[0]._ver       | productVersion   | 
      
  
     Then Server should return "415" Status for LE 
     
  @Negative @ALM_426079 
  Scenario: Verify that create LEC is not working with the configuration defined in LPB when change method from POST to PUT 
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "PUT" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json"
      | description      | key                           | value            | 
      | Random value     | extensions.sectionId          | Dynamic          | 
      | key from excel   | extends.sources[0]._id        | productId        | 
      | key from excel   | extends.sources[0]._bssVer    | bssver           | 
      | key from excel   | learningModel._id             | LearningModelid  | 
      | key from excel   | learningModel._ver            | LearningModelver | 
      | key from excel   | extends.sources[0]._ver       | productVersion   | 
      
  
     Then Server should return "405" Status for LE 
  
  
  
  

 
  
  
         