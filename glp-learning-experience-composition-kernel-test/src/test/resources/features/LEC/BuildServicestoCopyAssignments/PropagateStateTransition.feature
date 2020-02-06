 @GLOB-62
 Feature: As a Tester I want to Validate the Update Learning Experience to propagate stateTransition
@tc:15
 @Story:GLP-57354 @ALM_431648 @Postive @Regression @Smoke
 Scenario Outline: GLP-FSR-SAeT_ENG_EC_UpdateLearningExperience_propagate_stateTransition_WithValid_data_true_PRE_COMPOSED_To_COMPOSED to PUBLISED to COMPOSED_TC001
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
   Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_Publish_Learning_Exp"
    
    When I send the "post" transition_state_request with propagate is true to "DomainURL/ENDPOINT_LEC_Publish_Learning_Exp" using request body as "updateStatus" with "application/json"
      | description        | key                        | value            |
      | key to be update   | previousState              | PRE_COMPOSED     | 
      | key to be update   | transitionState            | COMPOSED         | 
      | key to be update   | reasons                    | ANYREASON        | 
      
       Given Set the endpoint for GET LE Collection based on AssetClass & Scope Tags
    When User sends the request with "<assetClass>" and "<scope.assets._id>" and "<scope.assets._bssVer>" and "<collectionDetails>" to GET LE collection 
    And Validate the Assignment status coming as PRE_COMPOSED/COMPOSED/PUBLISHED

    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_Publish_Learning_Exp"
    
   When I send the "post" transition_state_request with propagate is true to "DomainURL/ENDPOINT_LEC_Publish_Learning_Exp" using request body as "updateStatus" with "application/json"
      | description        | key                        | value            |
      | key to be update   | previousState              | COMPOSED         | 
      | key to be update   | transitionState            | PUBLISHED        | 
      | key to be update   | reasons                    | ANYREASON        | 
      
      
    Given Set the endpoint for GET LE Collection based on AssetClass & Scope Tags
    When User sends the request with "<assetClass>" and "<scope.assets._id>" and "<scope.assets._bssVer>" and "<collectionDetails>" to GET LE collection 
    And Validate the Assignment status coming as PRE_COMPOSED/COMPOSED/PUBLISHED
  
  
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_Publish_Learning_Exp"
    When I send the "post" transition_state_request with propagate is true to "DomainURL/ENDPOINT_LEC_Publish_Learning_Exp" using request body as "updateStatus" with "application/json"
      | description        | key                        | value            |
      | key to be update   | previousState              | PUBLISHED        | 
      | key to be update   | transitionState            | COMPOSED         | 
      | key to be update   | reasons                    | ANYREASON        | 
      
       Given Set the endpoint for GET LE Collection based on AssetClass & Scope Tags
    When User sends the request with "<assetClass>" and "<scope.assets._id>" and "<scope.assets._bssVer>" and "<collectionDetails>" to GET LE collection 
    And Validate the Assignment status coming as PRE_COMPOSED/COMPOSED/PUBLISHED

       
     Examples: 
            | assetClass | scope.assets._id          | scope.assets._bssVer |collectionDetails         |StatusCode  |LEID  |
            | ASSIGNMENT | Dynamic1                  | Dynamic2             |  _created,language       |200         |System|
            
 @Story:GLP-57354 @ALM_429973 @Negative @Regression         
Scenario: GLP-FSR-SAeT_ENG_EC_UpdateLearningExperience_propagate_stateTransition_again_true_PRE_COMPOSED_To_COMPOSED_TC002
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
   Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_Publish_Learning_Exp"
    
    When I send the "post" transition_state_request with propagate is true to "DomainURL/ENDPOINT_LEC_Publish_Learning_Exp" using request body as "updateStatus" with "application/json"
      | description        | key                        | value            |
      | key to be update   | previousState              | PRE_COMPOSED     | 
      | key to be update   | transitionState            | COMPOSED         | 
      | key to be update   | reasons                    | ANYREASON        | 
   
      
       When I send the "post" transition_state_request again with propagate is true to "DomainURL/ENDPOINT_LEC_Publish_Learning_Exp" using request body as "updateStatus" with "application/json"
     | description        | key                        | value            |
      | key to be update   | previousState              | PRE_COMPOSED     | 
      | key to be update   | transitionState            | COMPOSED         | 
      | key to be update   | reasons                    | ANYREASON        | 
      
      Then Server should return "400" Status for LE
     
     @Story:GLP-57354 @ALM_429976 @Negative  @Regression
 Scenario: GLP-FSR-SAeT_ENG_EC_UpdateLearningExperience_propagate_stateTransition_ErrorMessageShouldComeWhenWeInterchangeValuesForPreviousStateAndTransitionState_TC003
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
   Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_Publish_Learning_Exp"
    
    When I send the "post" transition_state_request again with propagate is true to "DomainURL/ENDPOINT_LEC_Publish_Learning_Exp" using request body as "updateStatus" with "application/json"
      | description        | key                        | value            |
      | key to be update   | previousState              | COMPOSED         | 
      | key to be update   | transitionState            | PRE_COMPOSED     | 
      | key to be update   | reasons                    | ANYREASON        | 
      Then Server should return "400" Status for LE
      
      @Story:GLP-57354 @ALM_429977 @Negative @Regression
      Scenario: GLP-FSR-SAeT_ENG_EC_UpdateLearningExperience_propagate_stateTransition_ErrorMessageShouldComeWhenWepassAnyInvalidValuesForPreviousStateAndTransitionState_TC004
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
   Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_Publish_Learning_Exp"
    
    When I send the "post" transition_state_request again with propagate is true to "DomainURL/ENDPOINT_LEC_Publish_Learning_Exp" using request body as "updateStatus" with "application/json"
      | description        | key                        | value            |
      | key to be update   | previousState              | composed         | 
      | key to be update   | transitionState            | abc              | 
      | key to be update   | reasons                    | ANYREASON        | 
      Then Server should return "400" Status for LE
      
      @Story:GLP-57354 @ALM_429978 @Negative  
      Scenario: GLP-FSR-SAeT_ENG_EC_UpdateLearningExperience_propagate_stateTransition_ErrorMessageShouldComeWhenWepassAnyNullValuesForPreviousStateAndTransitionState_TC005
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
   Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_Publish_Learning_Exp"
    
    When I send the "post" transition_state_request again with propagate is true to "DomainURL/ENDPOINT_LEC_Publish_Learning_Exp" using request body as "updateStatus" with "application/json"
      | description        | key                        | value            |
      | key to be update   | previousState              | NULL             | 
      | key to be update   | transitionState            | NULL             | 
      | key to be update   | reasons                    | ANYREASON        | 
      Then Server should return "400" Status for LE
      
      @Story:GLP-57354 @ALM_429979 @Negative  @Regression
      Scenario: GLP-FSR-SAeT_ENG_EC_UpdateLearningExperience_propagate_stateTransition_ErrorMessageShouldComeWhenWepassBlankValuesForPreviousStateAndTransitionState_TC006
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
   Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_Publish_Learning_Exp"
    
    When I send the "post" transition_state_request again with propagate is true to "DomainURL/ENDPOINT_LEC_Publish_Learning_Exp" using request body as "updateStatus" with "application/json"
      | description        | key                        | value     |
      | key to be update   | previousState              |           | 
      | key to be update   | transitionState            |           | 
      | key to be update   | reasons                    | ANYREASON | 
      Then Server should return "400" Status for LE