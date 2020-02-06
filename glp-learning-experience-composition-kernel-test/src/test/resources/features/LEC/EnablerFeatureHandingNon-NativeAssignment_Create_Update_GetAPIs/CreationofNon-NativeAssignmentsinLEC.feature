@GLOB-126
Feature: Create non-native assignment

@Story:GLP-55501  @ALM_428009 @Positive @Smoke @Regression
Scenario Outline: GLP-FSR-SAeT_ENG_EC_Creation_of_Non-Native_ Assignments_in_Experience_Composition_PositiveTC001
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
    When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "Non-NativeAssignment" with "application/json"
      | description                    | key                     | value                           | 
      | key from excel                 | learningModel._id       | Non-Native_Assignment_LearningModelid      | 
      | key from excel                 | learningModel._ver      | Non-Native_Assignment_LearningModelver     | 
      | key from excel                 | learningModel._bssVer   | Non-Native_Assignment_LearningModelVersion |  
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
		| assetClass          | scope.assets._id          | scope.assets._bssVer |collectionDetails         |StatusCode  |LEID  |
        | NONNATIVEASSIGNMENT | Dynamic1                  | Dynamic2             |  _created,language       |200         |System|
   
   
   
@Story:GLP-55501  @ALM_428010 @Negative @Regression
Scenario: GLP-FSR-SAeT_ENG_EC_Creation_of_Non-Native_ Assignments_in_Experience_Composition_InValid_Resource_plan_ASSIGNMENTEMPLATE_Negative_TC002
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json"
      | description    | key                        | value            | 
      | Random value   | extensions.sectionId       | Dynamic          | 
      | key from excel | extends.sources[0]._id     | productId        | 
      | key from excel | extends.sources[0]._bssVer | bssver           | 
      | key from excel | learningModel._id          | LearningModelid  | 
      | key from excel | learningModel._ver         | LearningModelver | 
      | key from excel | extends.sources[0]._ver    | productVersion   | 
      
	
    When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "Non-NativeAssignment" with "application/json"
      | description                    | key                            | value                           | 
      | key from excel                 | learningModel._id              | Non-Native_Assignment_LearningModelid      | 
      | key from excel                 | learningModel._ver             | Non-Native_Assignment_LearningModelver     | 
      | key from excel                 | learningModel._bssVer          | Non-Native_Assignment_LearningModelVersion |  
      | Id from create Course          | scope.assets[0]._id            | dynamic                         | 
      | version from create Course     | scope.assets[0]._ver           | dynamic                         | 
      | bss version from create Course | scope.assets[0]._bssVer        | dynamic                         | 
      | key to be update               | resourcePlan[2].resourceRef    | ASSIGNMENTEMPLATE1              |
    Then Server should return "400" Status for LE
    
    
@Story:GLP-55501  @ALM_428011 @Negative @Regression
Scenario: GLP-FSR-SAeT_ENG_EC_Creation_of_Non-Native_ Assignments_in_Experience_Composition_ASSIGNMENTEMPLATE_resourceType_enum_Negative_TC003
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json"
      | description    | key                        | value            | 
      | Random value   | extensions.sectionId       | Dynamic          | 
      | key from excel | extends.sources[0]._id     | productId        | 
      | key from excel | extends.sources[0]._bssVer | bssver           | 
      | key from excel | learningModel._id          | LearningModelid  | 
      | key from excel | learningModel._ver         | LearningModelver | 
      | key from excel | extends.sources[0]._ver    | productVersion   | 
      
	
    When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "Non-NativeAssignment" with "application/json"
      | description                    | key                                                 | value                           | 
      | key from excel                 | learningModel._id                                   | Non-Native_Assignment_LearningModelid      | 
      | key from excel                 | learningModel._ver                                  | Non-Native_Assignment_LearningModelver     | 
      | key from excel                 | learningModel._bssVer                               | Non-Native_Assignment_LearningModelVersion |  
      | Id from create Course          | scope.assets[0]._id                                 | dynamic                         | 
      | version from create Course     | scope.assets[0]._ver                                | dynamic                         | 
      | bss version from create Course | scope.assets[0]._bssVer                             | dynamic                         | 
      | key to be update               | resources.ASSIGNMENTEMPLATE._resourceType           | CONTENT                         |
    Then Server should return "400" Status for LE
    
@Story:GLP-55501  @ALM_428012 @Negative @Regression
Scenario: GLP-FSR-SAeT_ENG_EC_Creation_of_Non-Native_ Assignments_in_Experience_Composition_InValid_Resource_ASSIGNMENTEMPLATE_category_enum_Negative_TC004
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json"
      | description    | key                        | value            | 
      | Random value   | extensions.sectionId       | Dynamic          | 
      | key from excel | extends.sources[0]._id     | productId        | 
      | key from excel | extends.sources[0]._bssVer | bssver           | 
      | key from excel | learningModel._id          | LearningModelid  | 
      | key from excel | learningModel._ver         | LearningModelver | 
      | key from excel | extends.sources[0]._ver    | productVersion   | 
      
	
    When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "Non-NativeAssignment" with "application/json"
      | description                    | key                                                 | value                           | 
      | key from excel                 | learningModel._id                                   | Non-Native_Assignment_LearningModelid      | 
      | key from excel                 | learningModel._ver                                  | Non-Native_Assignment_LearningModelver     | 
      | key from excel                 | learningModel._bssVer                               | Non-Native_Assignment_LearningModelVersion |  
      | Id from create Course          | scope.assets[0]._id                                 | dynamic                         | 
      | version from create Course     | scope.assets[0]._ver                                | dynamic                         | 
      | bss version from create Course | scope.assets[0]._bssVer                             | dynamic                         | 
      | key to be update               | resources.ASSIGNMENTEMPLATE.category                | CONTENT                         |
    Then Server should return "400" Status for LE
    
    
@Story:GLP-55501  @ALM_428013 @Negative @Regression
Scenario: GLP-FSR-SAeT_ENG_EC_Creation_of_Non-Native_ Assignments_in_Experience_Composition_InValid_Resource_ASSIGNMENTEMPLATE_model_enum_Negative_TC005
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json"
      | description    | key                        | value            | 
      | Random value   | extensions.sectionId       | Dynamic          | 
      | key from excel | extends.sources[0]._id     | productId        | 
      | key from excel | extends.sources[0]._bssVer | bssver           | 
      | key from excel | learningModel._id          | LearningModelid  | 
      | key from excel | learningModel._ver         | LearningModelver | 
      | key from excel | extends.sources[0]._ver    | productVersion   | 
      
	
    When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "Non-NativeAssignment" with "application/json"
      | description                    | key                                                 | value                           | 
      | key from excel                 | learningModel._id                                   | Non-Native_Assignment_LearningModelid      | 
      | key from excel                 | learningModel._ver                                  | Non-Native_Assignment_LearningModelver     | 
      | key from excel                 | learningModel._bssVer                               | Non-Native_Assignment_LearningModelVersion |  
      | Id from create Course          | scope.assets[0]._id                                 | dynamic                         | 
      | version from create Course     | scope.assets[0]._ver                                | dynamic                         | 
      | bss version from create Course | scope.assets[0]._bssVer                             | dynamic                         | 
      | key to be update               | resources.ASSIGNMENTEMPLATE.model                   | narrative                       |
    Then Server should return "400" Status for LE    
    
    
@Story:GLP-55501  @ALM_428014 @Negative @Regression
Scenario: GLP-FSR-SAeT_ENG_EC_Creation_of_Non-Native_ Assignments_in_Experience_Composition_enum_values_as_null_resource_type_Negative_TC006
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json"
      | description    | key                        | value            | 
      | Random value   | extensions.sectionId       | Dynamic          | 
      | key from excel | extends.sources[0]._id     | productId        | 
      | key from excel | extends.sources[0]._bssVer | bssver           | 
      | key from excel | learningModel._id          | LearningModelid  | 
      | key from excel | learningModel._ver         | LearningModelver | 
      | key from excel | extends.sources[0]._ver    | productVersion   | 
      
	
    When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "Non-NativeAssignment" with "application/json"
      | description                    | key                                                 | value                           | 
      | key from excel                 | learningModel._id                                   | Non-Native_Assignment_LearningModelid      | 
      | key from excel                 | learningModel._ver                                  | Non-Native_Assignment_LearningModelver     | 
      | key from excel                 | learningModel._bssVer                               | Non-Native_Assignment_LearningModelVersion |  
      | Id from create Course          | scope.assets[0]._id                                 | dynamic                         | 
      | version from create Course     | scope.assets[0]._ver                                | dynamic                         | 
      | bss version from create Course | scope.assets[0]._bssVer                             | dynamic                         | 
      | key to be update               | resources.ASSIGNMENTEMPLATE._resourceType           | null                            |
    Then Server should return "400" Status for LE        
    
    
@Story:GLP-55501  @ALM_428015 @Negative @Regression
Scenario: GLP-FSR-SAeT_ENG_EC_Creation_of_Non-Native_ Assignments_in_Experience_Composition_enum_values_as_null_Category_Negative_TC007
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json"
      | description    | key                        | value            | 
      | Random value   | extensions.sectionId       | Dynamic          | 
      | key from excel | extends.sources[0]._id     | productId        | 
      | key from excel | extends.sources[0]._bssVer | bssver           | 
      | key from excel | learningModel._id          | LearningModelid  | 
      | key from excel | learningModel._ver         | LearningModelver | 
      | key from excel | extends.sources[0]._ver    | productVersion   | 
      
	
    When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "Non-NativeAssignment" with "application/json"
      | description                    | key                                                 | value                           | 
      | key from excel                 | learningModel._id                                   | Non-Native_Assignment_LearningModelid      | 
      | key from excel                 | learningModel._ver                                  | Non-Native_Assignment_LearningModelver     | 
      | key from excel                 | learningModel._bssVer                               | Non-Native_Assignment_LearningModelVersion |  
      | Id from create Course          | scope.assets[0]._id                                 | dynamic                         | 
      | version from create Course     | scope.assets[0]._ver                                | dynamic                         | 
      | bss version from create Course | scope.assets[0]._bssVer                             | dynamic                         | 
      | key to be update               | resources.ASSIGNMENTEMPLATE.category                | null                      |
    Then Server should return "400" Status for LE   
    
@Story:GLP-55501  @ALM_428016 @Negative @Regression
Scenario: GLP-FSR-SAeT_ENG_EC_Creation_of_Non-Native_ Assignments_in_Experience_Composition_enum_values_as_null_Model_Negative_TC008
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json"
      | description    | key                        | value            | 
      | Random value   | extensions.sectionId       | Dynamic          | 
      | key from excel | extends.sources[0]._id     | productId        | 
      | key from excel | extends.sources[0]._bssVer | bssver           | 
      | key from excel | learningModel._id          | LearningModelid  | 
      | key from excel | learningModel._ver         | LearningModelver | 
      | key from excel | extends.sources[0]._ver    | productVersion   | 
      
	
    When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "Non-NativeAssignment" with "application/json"
      | description                    | key                                                 | value                           | 
      | key from excel                 | learningModel._id                                   | Non-Native_Assignment_LearningModelid      | 
      | key from excel                 | learningModel._ver                                  | Non-Native_Assignment_LearningModelver     | 
      | key from excel                 | learningModel._bssVer                               | Non-Native_Assignment_LearningModelVersion |  
      | Id from create Course          | scope.assets[0]._id                                 | dynamic                         | 
      | version from create Course     | scope.assets[0]._ver                                | dynamic                         | 
      | bss version from create Course | scope.assets[0]._bssVer                             | dynamic                         | 
      | key to be update               | resources.ASSIGNMENTEMPLATE.model                   | null                            |
    Then Server should return "400" Status for LE    
    
    
@Story:GLP-55501  @ALM_428017 @Negative @Regression
Scenario Outline: GLP-FSR-SAeT_ENG_EC_Creation_of_Non-Native_ Assignments_in_Experience_Composition_not_sending_non mandetory filed_Positive_TC009
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
    When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "Non-NativeAssignment" with "application/json"
      | description                    | key                     | value                           | 
      | key from excel                 | learningModel._id       | Non-Native_Assignment_LearningModelid      | 
      | key from excel                 | learningModel._ver      | Non-Native_Assignment_LearningModelver     | 
      | key from excel                 | learningModel._bssVer   | Non-Native_Assignment_LearningModelVersion |  
      | Id from create Course          | scope.assets[0]._id     | dynamic                         | 
      | version from create Course     | scope.assets[0]._ver    | dynamic                         | 
      | bss version from create Course | scope.assets[0]._bssVer | dynamic                         | 
      |key to be remove                |resources.ASSIGNMENTEMPLATE.data.templateId||
    Then Server should return "201" Status for LE
    Then Schema should validate for POST LE
    Given Set the endpoint for GET LE Collection based on AssetClass & Scope Tags
	When User sends the request with "<assetClass>" and "<scope.assets._id>" and "<scope.assets._bssVer>" and "<collectionDetails>" to GET LE collection 
	And Validate LE status coming as PRE_COMPOSED
	And Verify the "<StatusCode>" code for GET LE collection based on AssetClass & Scope Tags
	And verify the assignment id present in response
     Examples: 
		| assetClass          | scope.assets._id          | scope.assets._bssVer |collectionDetails         |StatusCode  |LEID  |
        | NONNATIVEASSIGNMENT | Dynamic1                  | Dynamic2             |  _created,language       |200         |System|

        
        
@Story:GLP-55501  @ALM_428018 @Negative @Regression
Scenario: GLP-FSR-SAeT_ENG_EC_Creation_of_Non-Native_ Assignments_in_Experience_Composition_enum_values_as_blank_Category_Negative_TC010
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json"
      | description    | key                        | value            | 
      | Random value   | extensions.sectionId       | Dynamic          | 
      | key from excel | extends.sources[0]._id     | productId        | 
      | key from excel | extends.sources[0]._bssVer | bssver           | 
      | key from excel | learningModel._id          | LearningModelid  | 
      | key from excel | learningModel._ver         | LearningModelver | 
      | key from excel | extends.sources[0]._ver    | productVersion   | 
      
	
    When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "Non-NativeAssignment" with "application/json"
      | description                    | key                                                 | value                           | 
      | key from excel                 | learningModel._id                                   | Non-Native_Assignment_LearningModelid      | 
      | key from excel                 | learningModel._ver                                  | Non-Native_Assignment_LearningModelver     | 
      | key from excel                 | learningModel._bssVer                               | Non-Native_Assignment_LearningModelVersion |  
      | Id from create Course          | scope.assets[0]._id                                 | dynamic                         | 
      | version from create Course     | scope.assets[0]._ver                                | dynamic                         | 
      | bss version from create Course | scope.assets[0]._bssVer                             | dynamic                         | 
      | key to be update               | resources.ASSIGNMENTEMPLATE.category                |                                 |
    Then Server should return "400" Status for LE        
    
    
@Story:GLP-55501  @ALM_428019 @Negative @Regression
Scenario: GLP-FSR-SAeT_ENG_EC_Creation_of_Non-Native_ Assignments_in_Experience_Composition_enum_values_as_blank_Model_Negative_TC011
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json"
      | description    | key                        | value            | 
      | Random value   | extensions.sectionId       | Dynamic          | 
      | key from excel | extends.sources[0]._id     | productId        | 
      | key from excel | extends.sources[0]._bssVer | bssver           | 
      | key from excel | learningModel._id          | LearningModelid  | 
      | key from excel | learningModel._ver         | LearningModelver | 
      | key from excel | extends.sources[0]._ver    | productVersion   | 
      
	
    When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "Non-NativeAssignment" with "application/json"
      | description                    | key                                                 | value                           | 
      | key from excel                 | learningModel._id                                   | Non-Native_Assignment_LearningModelid      | 
      | key from excel                 | learningModel._ver                                  | Non-Native_Assignment_LearningModelver     | 
      | key from excel                 | learningModel._bssVer                               | Non-Native_Assignment_LearningModelVersion |  
      | Id from create Course          | scope.assets[0]._id                                 | dynamic                         | 
      | version from create Course     | scope.assets[0]._ver                                | dynamic                         | 
      | bss version from create Course | scope.assets[0]._bssVer                             | dynamic                         | 
      | key to be update               | resources.ASSIGNMENTEMPLATE.model                   |                                 |
    Then Server should return "400" Status for LE   
    
@Story:GLP-55501  @ALM_428020 @Negative @Regression
Scenario: GLP-FSR-SAeT_ENG_EC_Creation_of_Non-Native_ Assignments_in_Experience_Composition_enum_values_as_blank_resourceType_Negative_TC012
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json"
      | description    | key                        | value            | 
      | Random value   | extensions.sectionId       | Dynamic          | 
      | key from excel | extends.sources[0]._id     | productId        | 
      | key from excel | extends.sources[0]._bssVer | bssver           | 
      | key from excel | learningModel._id          | LearningModelid  | 
      | key from excel | learningModel._ver         | LearningModelver | 
      | key from excel | extends.sources[0]._ver    | productVersion   | 
      
	
    When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "Non-NativeAssignment" with "application/json"
      | description                    | key                                                 | value                           | 
      | key from excel                 | learningModel._id                                   | Non-Native_Assignment_LearningModelid      | 
      | key from excel                 | learningModel._ver                                  | Non-Native_Assignment_LearningModelver     | 
      | key from excel                 | learningModel._bssVer                               | Non-Native_Assignment_LearningModelVersion |  
      | Id from create Course          | scope.assets[0]._id                                 | dynamic                         | 
      | version from create Course     | scope.assets[0]._ver                                | dynamic                         | 
      | bss version from create Course | scope.assets[0]._bssVer                             | dynamic                         | 
      | key to be update               | resources.ASSIGNMENTEMPLATE._resourceType           |                                 |
    Then Server should return "400" Status for LE     