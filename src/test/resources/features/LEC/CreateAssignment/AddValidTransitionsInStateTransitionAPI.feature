@GLOB-38
Feature: Add valid transitions in stateTransition API

@Story:GLP-56125 @ALM_428536 @Positive @Smoke @Regression
 Scenario: LEC_GLP-56125_PostLearningExperience_stateTransitions_WithValid_data_PRE_COMPOSED_To_COMPOSED
  
  Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json"
      | description    | key                        | value            |
      | Random value   | extensions.sectionId       | Dynamic          | 
      | key from excel | extends.sources[0]._id     | productId        | 
      | key from excel | extends.sources[0]._bssVer | bssver           | 
      | key from excel | learningModel._id          | LearningModelid  | 
      | key from excel | learningModel._ver         | LearningModelver | 
      | key from excel | extends.sources[0]._ver    | productVersion   | 
  
   Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_Publish_Learning_Exp"
    
    When I send the "post" transition_state_request to "DomainURL/ENDPOINT_LEC_Publish_Learning_Exp" using request body as "updateStatus" with "application/json"
      | description        | key                        | value            |
      | key to be update   | previousState              | PRE_COMPOSED     | 
      | key to be update   | transitionState            | COMPOSED         | 
      | key to be update   | reasons                    | ANYREASON        | 
        
   Then Server should return "200" Status for LE   
      
 @Story:GLP-56125     @ALM_428537 @Positive @Smoke @Regression
 Scenario:  LEC_GLP-56125_PostLearningExperience_stateTransitions_WithValid_data_PRE_COMPOSED_To_COMPOSED_With_NonMandotory_Fields
      
      Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json"
      | description    | key                        | value            |
      | Random value   | extensions.sectionId       | Dynamic          | 
      | key from excel | extends.sources[0]._id     | productId        | 
      | key from excel | extends.sources[0]._bssVer | bssver           | 
      | key from excel | learningModel._id          | LearningModelid  | 
      | key from excel | learningModel._ver         | LearningModelver | 
      | key from excel | extends.sources[0]._ver    | productVersion   | 
  
   Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_Publish_Learning_Exp"
    
    When I send the "post" transition_state_request to "DomainURL/ENDPOINT_LEC_Publish_Learning_Exp" using request body as "updateStatus" with "application/json"
      | description        | key                        | value            |
      | key to be update   | previousState              | PRE_COMPOSED     | 
      | key to be update   | transitionState            | COMPOSED         | 
      | key to be update   | reasons                    |                  | 
Then Server should return "200" Status for LE      

@Story:GLP-56125    @ALM_428538  @Positive @Smoke @Regression
Scenario: LEC_GLP-56125_PostLearningExperience_stateTransitions_WithValid_data_PUBLISHED_To_COMPOSED
      
      Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json"
      | description    | key                        | value            |
      | Random value   | extensions.sectionId       | Dynamic          | 
      | key from excel | extends.sources[0]._id     | productId        | 
      | key from excel | extends.sources[0]._bssVer | bssver           | 
      | key from excel | learningModel._id          | LearningModelid  | 
      | key from excel | learningModel._ver         | LearningModelver | 
      | key from excel | extends.sources[0]._ver    | productVersion   | 
  
   Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_Publish_Learning_Exp"
    
    When I send the "post" transition_state_request to "DomainURL/ENDPOINT_LEC_Publish_Learning_Exp" using request body as "updateStatus" with "application/json"
      | description        | key                        | value            |
      | key to be update   | previousState              | PRE_COMPOSED     | 
      | key to be update   | transitionState            | COMPOSED         | 
      | key to be update   | reasons                    | ANYREASON        | 
      
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_Publish_Learning_Exp"
    
   When I send the "post" transition_state_request to "DomainURL/ENDPOINT_LEC_Publish_Learning_Exp" using request body as "updateStatus" with "application/json"
      | description        | key                        | value            |
      | key to be update   | previousState              | COMPOSED         | 
      | key to be update   | transitionState            | PUBLISHED        | 
      | key to be update   | reasons                    | ANYREASON        | 
      
       Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_Publish_Learning_Exp"
    
   When I send the "post" transition_state_request to "DomainURL/ENDPOINT_LEC_Publish_Learning_Exp" using request body as "updateStatus" with "application/json"
      | description        | key                        | value            |
      | key to be update   | previousState              | PUBLISHED        | 
      | key to be update   | transitionState            | COMPOSED         | 
      | key to be update   | reasons                    | ANYREASON        | 
  
     Then Server should return "200" Status for LE
      
       
      
@Story:GLP-56125 @ALM_428539   @Positive @Smoke @Regression
Scenario: LEC_GLP-56125_PostLearningExperience_stateTransitions_WithValid_data_data_PUBLISHED_To_COMPOSED_With_NonMandotory_Fields 
      
     Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json"
      | description    | key                        | value            |
      | Random value   | extensions.sectionId       | Dynamic          | 
      | key from excel | extends.sources[0]._id     | productId        | 
      | key from excel | extends.sources[0]._bssVer | bssver           | 
      | key from excel | learningModel._id          | LearningModelid  | 
      | key from excel | learningModel._ver         | LearningModelver | 
      | key from excel | extends.sources[0]._ver    | productVersion   | 
  
   Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_Publish_Learning_Exp"
    
   When I send the "post" transition_state_request to "DomainURL/ENDPOINT_LEC_Publish_Learning_Exp" using request body as "updateStatus" with "application/json"
      | description        | key                        | value            |
      | key to be update   | previousState              | PRE_COMPOSED     | 
      | key to be update   | transitionState            | COMPOSED         | 
      | key to be update   | reasons                    | ANYREASON        | 
      
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_Publish_Learning_Exp"
    
   When I send the "post" transition_state_request to "DomainURL/ENDPOINT_LEC_Publish_Learning_Exp" using request body as "updateStatus" with "application/json"
      | description        | key                        | value            |
      | key to be update   | previousState              | COMPOSED         | 
      | key to be update   | transitionState            | PUBLISHED        | 
      | key to be update   | reasons                    | ANYREASON        | 
      
       Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_Publish_Learning_Exp"
    
   When I send the "post" transition_state_request to "DomainURL/ENDPOINT_LEC_Publish_Learning_Exp" using request body as "updateStatus" with "application/json"
      | description        | key                        | value            |
      | key to be update   | previousState              | PUBLISHED        | 
      | key to be update   | transitionState            | COMPOSED         | 
      | key to be update   | reasons                    |                  | 
  
     Then Server should return "200" Status for LE
      
