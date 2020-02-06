@GLOB-80
Feature: As a Tester I want to Validate the clone learning experience

 @Story:GLP-57286 @Story:GLP-64948 @ALM_430635 @Positive @Smoke @Regression
 Scenario Outline: GLP-FSR-SAeT_ENG_EC_CloneLearningExperience_Course_WithValidValue_SHALLOW and DEEP_TC001
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
	When I send the "post" request "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperienceAssignment" with "application/json"
      | description                    | key                     | value                           | 
      | key from excel                 | learningModel._id       | Assignment_LearningModelid      | 
      | key from excel                 | learningModel._ver      | Assignment_LearningModelver     | 
      | key from excel                 | learningModel._bssVer   | Assignment_LearningModelVersion |  
      | Id from create Course          | scope.assets[0]._id     | dynamic                         | 
      | version from create Course     | scope.assets[0]._ver    | dynamic                         | 
      | bss version from create Course | scope.assets[0]._bssVer | dynamic                         | 
  
    Then Server should return "201" Status for LE
    
     Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_CLONE"
     When I send the "post" request with LEID and clone Type to "DomainURL/ENDPOINT_LEC_CLONE" using request body as "CloneLearningExp" with "application/json" using <type>
     | description    | key                               | value                     | 
     | Random value   | patches[4].value.sectionId        |     Dynamic               | 
    And Verify the response which is found in clone learning experience course using "<type>"
    | key        | value            | 
    | AssetClass | STANDALONECOURSE |
    | AssetClass | ASSIGNMENT       |
     Then Server should return "201" Status for LE
     
     Examples:
     |type   |
     |SHALLOW|
     |DEEP   |

      @Story:GLP-57286 @Story:GLP-64948 @ALM_430636 @Positive @Smoke @Regression
     Scenario Outline: GLP-FSR-SAeT_ENG_EC_CloneLearningExperience_Assignment_WithValidValue_SHALLOW and DEEP_TC002
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
    
     Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_CLONE"
     When I send the "post" request with LEID and clone Type to "DomainURL/ENDPOINT_LEC_CLONE" using request body as "CloneLearningExp" with "application/json" using <type>
     | description    | key                               | value                     | 
     | Random value   | patches[4].value.sectionId        |     Dynamic               | 
      And Verify the response which is found in clone learning experience assignment
    | key        | value            | 
    | AssetClass | ASSIGNMENT       |
     Then Server should return "201" Status for LE     
    Examples:
     |type   |
     |SHALLOW|
     |DEEP   |
     @Story:GLP-57286 @ALM_429835 @Positive @Regression
     Scenario Outline: GLP-FSR-SAeT_ENG_EC_CloneLearningExperience_json schema validation_TC003 
   Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_CLONE"
     When I send the "post" request with LEID and clone Type to "DomainURL/ENDPOINT_LEC_CLONE" using request body as "CloneLearningExp" with "application/json" using <type>
     | description    | key                               | value                     | 
     | Random value   | patches[4].value.sectionId        |     Dynamic               |      
     Then Server should return "201" Status for LE
     Then Schema should validate for Clone Learning Exp 
     Examples:
     |type   |
     |SHALLOW|
     |DEEP   |
     @Story:GLP-57286 @ALM_429837 @Negative @Regression
     Scenario Outline: GLP-FSR-SAeT_ENG_EC_CloneLearningExperience_missingMandatoryFields_TC005 
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
	When I send the "post" request "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperienceAssignment" with "application/json"
      | description                    | key                     | value                           | 
      | key from excel                 | learningModel._id       | Assignment_LearningModelid      | 
      | key from excel                 | learningModel._ver      | Assignment_LearningModelver     | 
      | key from excel                 | learningModel._bssVer   | Assignment_LearningModelVersion |  
      | Id from create Course          | scope.assets[0]._id     | dynamic                         | 
      | version from create Course     | scope.assets[0]._ver    | dynamic                         | 
      | bss version from create Course | scope.assets[0]._bssVer | dynamic                         | 
  
    Then Server should return "201" Status for LE
    
     
   Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_CLONE"
     When I send the "post" request with LEID and clone Type to "DomainURL/ENDPOINT_LEC_CLONE" using request body as "CloneLearningExp" with "application/json" using <type>
     | description                       | key                                   | value                     | 
     | Random value                      | patches[4].value.sectionId            |    Dynamic                |   
     | key to be update                  |  patches[0].value.category            |                           |
     Then Server should return "400" Status for LE
     Examples:
     |type   |
     |SHALLOW|
     |DEEP   |
     
     
      @Story:GLP-57286 @ALM_429839 @Negative @Regression
       Scenario Outline: GLP-FSR-SAeT_ENG_EC_CloneLearningExperience_ReplaceResources_Blank_TC006 
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
	When I send the "post" request "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperienceAssignment" with "application/json"
      | description                    | key                     | value                           | 
      | key from excel                 | learningModel._id       | Assignment_LearningModelid      | 
      | key from excel                 | learningModel._ver      | Assignment_LearningModelver     | 
      | key from excel                 | learningModel._bssVer   | Assignment_LearningModelVersion |  
      | Id from create Course          | scope.assets[0]._id     | dynamic                         | 
      | version from create Course     | scope.assets[0]._ver    | dynamic                         | 
      | bss version from create Course | scope.assets[0]._bssVer | dynamic                         | 
  
    Then Server should return "201" Status for LE
    
   Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_CLONE"
     When I send the "post" request with LEID and clone Type to "DomainURL/ENDPOINT_LEC_CLONE" using request body as "CloneLearningExp" with "application/json" using <type>
     | description                       | key                                   | value                     | 
     | Random value                      | patches[4].value.sectionId            |    Dynamic                |   
     | key to be update                  |  patches[0].value.category                  |     CONTENT                     |
     Then Server should return "400" Status for LE
     Examples:
     |type   |
     |SHALLOW|
     |DEEP   |
   @Story:GLP-57286 @ALM_429841 @Negative @Regression
       Scenario Outline: GLP-FSR-SAeT_ENG_EC_CloneLearningExperience_Invalid_ReplaceConfiguration_TC007 
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
	When I send the "post" request "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperienceAssignment" with "application/json"
      | description                    | key                     | value                           | 
      | key from excel                 | learningModel._id       | Assignment_LearningModelid      | 
      | key from excel                 | learningModel._ver      | Assignment_LearningModelver     | 
      | key from excel                 | learningModel._bssVer   | Assignment_LearningModelVersion |  
      | Id from create Course          | scope.assets[0]._id     | dynamic                         | 
      | version from create Course     | scope.assets[0]._ver    | dynamic                         | 
      | bss version from create Course | scope.assets[0]._bssVer | dynamic                         | 
  
    Then Server should return "201" Status for LE
    
   Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_CLONE"
     When I send the "post" request with LEID and clone Type to "DomainURL/ENDPOINT_LEC_CLONE" using request body as "CloneLearningExp" with "application/json" using <type>
     | description                       | key                                   | value                     | 
     | Random value                      | patches[4].value.sectionId            |    Dynamic                |   
     | key to be update                  |  patches[3].value.policyGroups        |     abc                   |
     Then Server should return "400" Status for LE
     
     Examples:
     |type   |
     |SHALLOW|
     |DEEP   |
  
   
  