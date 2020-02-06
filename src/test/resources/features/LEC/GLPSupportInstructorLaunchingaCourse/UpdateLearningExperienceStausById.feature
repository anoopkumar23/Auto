@GLOB-6
@Story:GLP-47206 @Story:GLP-56125
Feature: As a Tester I want to Validate the Publish Learning Experience

@ALM_408622 @SchemaValidation
  Scenario: Validate the Json Schema for POST Publish Learning Experience 
  
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
  
  
     Then Schema should validate for Publish Learning Experience
  
 
 @ALM_404808 @ALM_404805 @Positive @Smoke @Regression
  Scenario: To POST Publish Learning Experience for postive data
  
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
  
     Then Server should return "200" Status for LE
     
  
   
  
  @ALM_404806 @ALM_404807 @ALM_404809 @ALM_404810 @Negative @Regression
  Scenario Outline:To POST Publish Learning Experience for Negative data
  
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json"
      | description    | key                        | value            |
      | Random value   | extensions.sectionId       | Dynamic          | 
      | key from excel | extends.sources[0]._id     | productId        | 
      | key from excel | extends.sources[0]._bssVer | bssver           | 
      | key from excel | learningModel._id          | LearningModelid  | 
      | key from excel | learningModel._ver         | LearningModelver | 
      | key from excel | extends.sources[0]._ver    | productVersion   | 
  
    Given set the endpoint for POST Publish Learning Experience 
     When User send the request to POST Publish Learning Experience with "<LEID>"
      | previousState1  | transitionState1  | reasons1  | 
      | <PreviousState> | <TransitionState> | <Reasons> | 
  
     Then verify the <Status> code
     Then Verify that "<errorMessage>" is as expected in response
  
    Examples: 
      | Description                | LEID         | PreviousState | TransitionState | Reasons          | Status  | errorMessage                  |
      | Change the Transtion State | System       | PUBLISHED     | COMPOSED        | null             | 400     | Bad Request               |
      | Send Transition State Null | System       | COMPOSED      | Null            | Change Required  | 400     | Bad Request               |
      | Send LE ID Null            | null         | COMPOSED      | PUBLISHED       | Change Required  | 400     | Bad Request               |
      | Send LE ID Not Exist in DB | UUID1234UUID | COMPOSED      | PUBLISHED       | Change Required  | 400     | Bad Request               |
      
      
@Negative @ALM_426080 @Regression
   Scenario: Validate the POST Publish Learning Experience for invalid method GET
  
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
  When I send the "PUT" request to "DomainURL/ENDPOINT_LEC_Publish_Learning_Exp" using request body as "updateStatus" with "application/json" and "leid"
      | description    | key                        | value            |     
      |key to be update| previousState              | COMPOSED         | 
      | key to be update| TransitionState           | PUBLISHED        | 
  
     Then Server should return "405" Status for LE
  

