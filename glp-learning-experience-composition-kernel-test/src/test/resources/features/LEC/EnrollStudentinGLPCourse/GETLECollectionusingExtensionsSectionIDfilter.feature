@GLOB-26
Feature: Modify LE collection route using extensions-sectionID filter

@ALM_415531 @ALM_415534 @ALM_415537 @Story:GLP-50324 @Regression @SchemaValidation
  Scenario Outline: To GET Learning Experience Collection using sectionId 
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json"
      | description    | key                        | value            |
      | Random value   | extensions.sectionId       | Dynamic          | 
      | key from excel | extends.sources[0]._id     | productId        | 
      | key from excel | extends.sources[0]._bssVer | bssver           | 
      | key from excel | learningModel._id          | LearningModelid  | 
      | key from excel | learningModel._ver         | LearningModelver | 
      | key from excel | extends.sources[0]._ver    | productVersion   | 
    And the Get LE data should be available in "LEC" in couchbase "cluster1"
    Given Set the endpoint for GET LE Collection
     When User send the request to GET LE collection with "<sectionId>"
     Then Verify the total number of count in response available in "LEC" in couchbase "cluster1"
  
    Examples: 
  
      | Status code | sectionId | 
      | 200         | System    | 
  

  @ALM_415533 @ALM_415540 @Negative @ALM_419534 @ALM_415536 @Story:GLP-50324 @Regression
  Scenario Outline: To GET Learning Experience Collection using invalid sectionId
    Given Set the endpoint for GET LE Collection
     When User send the request to GET LE collection with "<sectionId>" "<LIMIT>" "<OFFSET>"  
      And Verify the "<count>" of LE for LE collection
  
    Examples: 
      | Description       | OFFSET | LIMIT | Status code | sectionId | count | 
      | Invalid SectionID | 5      | 8     | 200         | invalid   | 0     | 
  
  
  @SchemaValidation @ALM_421427 @ALM_415539 @Story:GLP-52463
  Scenario Outline: To validate response schema for GET LE collection API with sectionID
   Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json"
      | description    | key                        | value            |
      | Random value   | extensions.sectionId       | Dynamic          | 
      | key from excel | extends.sources[0]._id     | productId        | 
      | key from excel | extends.sources[0]._bssVer | bssver           | 
      | key from excel | learningModel._id          | LearningModelid  | 
      | key from excel | learningModel._ver         | LearningModelver | 
      | key from excel | extends.sources[0]._ver    | productVersion   | 
      And the Get LE data should be available in "LEC" in couchbase "cluster1" 
    Given Set the endpoint for GET LE Collection
     When User send the request to GET LE collection with "<sectionId>" 
      And Verify the json schema in response for GET LE collection with sectionID
      And Verify the "<Statuscode>" code for LE collection 
    Examples: 
      | sectionId | Statuscode|
      | System    | 200       |
  

  @Smoke @Positive @ALM_421428  @Story:GLP_52463 @Regression
  Scenario Outline: To verify one-to-one mapping between Learning Experience and Section Id
   Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json"
      | description    | key                        | value            |
      | Random value   | extensions.sectionId       | Dynamic          | 
      | key from excel | extends.sources[0]._id     | productId        | 
      | key from excel | extends.sources[0]._bssVer | bssver           | 
      | key from excel | learningModel._id          | LearningModelid  | 
      | key from excel | learningModel._ver         | LearningModelver | 
      | key from excel | extends.sources[0]._ver    | productVersion   | 
      And the Get LE data should be available in "LEC" in couchbase "cluster1"  
    Given Set the endpoint for GET LE Collection
     When User send the request to GET LE collection with "<sectionId>"
      And Verify the "<Count>" of Learning Experience in response
      And Verify the "<Status code>" code for LE collection 
    Examples: 
      | Count | Status code | sectionId | 
      | 1     | 200         | System    | 
  

  @Smoke @Positive @ALM_421429  @Story:GLP-52463  @Regression
  Scenario Outline: To verify extensions.sectionId filter
   Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json"
      | description    | key                        | value            |
      | Random value   | extensions.sectionId       | Dynamic          | 
      | key from excel | extends.sources[0]._id     | productId        | 
      | key from excel | extends.sources[0]._bssVer | bssver           | 
      | key from excel | learningModel._id          | LearningModelid  | 
      | key from excel | learningModel._ver         | LearningModelver | 
      | key from excel | extends.sources[0]._ver    | productVersion   | 
      And the Get LE data should be available in "LEC" in couchbase "cluster1"    
    Given Set the endpoint for GET LE Collection
     When User send the request to GET LE collection with "<sectionId>"
      And Verify the "<Count>" of Learning Experience in response
      And Verify the "<Status code>" code for LE collection 
    Examples: 
      | Count | Status code | sectionId | 
      | 1     | 200         | System    | 
  

  @Smoke @Positive @ALM_421432 @Story:GLP-52463 @Regression
  Scenario Outline: To verify collectionDetails filter in GET LEC collection request
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json"
      | description    | key                        | value            |
      | Random value   | extensions.sectionId       | Dynamic          | 
      | key from excel | extends.sources[0]._id     | productId        | 
      | key from excel | extends.sources[0]._bssVer | bssver           | 
      | key from excel | learningModel._id          | LearningModelid  | 
      | key from excel | learningModel._ver         | LearningModelver | 
      | key from excel | extends.sources[0]._ver    | productVersion   | 
      And the Get LE data should be available in "LEC" in couchbase "cluster1"    
    Given Set the endpoint for GET LE Collection
     When User send the request to GET LE collection with "<sectionId>" and "<collectionDetails>"
      And Verify that json response contains the columns passed in collectionDetails filter
      And Verify the "<Count>" of Learning Experience in response
      And Verify the "<Status code>" code for LE collection 
    Examples: 
      | Count | Status code | sectionId | collectionDetails                                       | 
      | 1     | 200         | System    | _created,_lastModified,expiresOn,tags,language,_docType | 
  

  @Smoke @Positive @ALM_421434 @Story:GLP-52463 @Regression
  Scenario Outline: To verify collectionDetails filter in GET LEC collection request when all is passed
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json"
      | description    | key                        | value            |
      | Random value   | extensions.sectionId       | Dynamic          | 
      | key from excel | extends.sources[0]._id     | productId        | 
      | key from excel | extends.sources[0]._bssVer | bssver           | 
      | key from excel | learningModel._id          | LearningModelid  | 
      | key from excel | learningModel._ver         | LearningModelver | 
      | key from excel | extends.sources[0]._ver    | productVersion   | 
      And the Get LE data should be available in "LEC" in couchbase "cluster1" 
    Given Set the endpoint for GET LE Collection
     When User send the request to GET LE collection with "<sectionId>" and "<collectionDetails>"
      And Verify that json response contains all the fields in response for the learning experience returned
      And Verify the "<Count>" of Learning Experience in response
      And Verify the "<Status code>" code for LE collection 
    Examples: 
      | Count | Status code | sectionId | collectionDetails | 
      | 1     | 200         | System    | all               | 
  

  @Negative @ALM_421431  @Story:GLP-52463 @Regression
  Scenario Outline: To Get Learning Experience Collection endpoint without any filter 
    Given Set the endpoint for GET LE Collection 
    When User sends the request with "<Method>" to GET LE collection
    And Verify the "<Status code>" code for LE collection
  
    Examples: 
     | Method | Status code | 
     | GET    | 400         | 
  
  @Negative @ALM_421433  @Story:GLP-52463 @Regression
  Scenario Outline: To verify embed filter no more works in Get Learning Experience Collection endpoint 
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json"
      | description    | key                        | value            |
      | Random value   | extensions.sectionId       | Dynamic          | 
      | key from excel | extends.sources[0]._id     | productId        | 
      | key from excel | extends.sources[0]._bssVer | bssver           | 
      | key from excel | learningModel._id          | LearningModelid  | 
      | key from excel | learningModel._ver         | LearningModelver | 
      | key from excel | extends.sources[0]._ver    | productVersion   | 
      And the Get LE data should be available in "LEC" in couchbase "cluster1" 
    Given Set the endpoint for GET LE Collection 
     When User send the request to GET Learning Experience collection with "<sectionId>" and "<embed>"
      And Verify the "<Status code>" code for LE collection
  
    Examples: 
      | embed | Status code | sectionId | 
      | true  | 400         | System    | 
  

  @Negative @ALM_421430 @Story:GLP-52463 @Regression
  Scenario Outline: To verify sectionId filter no more works in Get Learning Experience Collection endpoint
   Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json"
      | description    | key                        | value            |
      | Random value   | extensions.sectionId       | Dynamic          | 
      | key from excel | extends.sources[0]._id     | productId        | 
      | key from excel | extends.sources[0]._bssVer | bssver           | 
      | key from excel | learningModel._id          | LearningModelid  | 
      | key from excel | learningModel._ver         | LearningModelver | 
      | key from excel | extends.sources[0]._ver    | productVersion   | 
      And the Get LE data should be available in "LEC" in couchbase "cluster1" 
    Given Set the endpoint for GET LE Collection 
     When User send the request to GET Learning Experience collection with "<sectionId>" incorrect filter
      And Verify the "<Status code>" code for LE collection
  
    Examples: 
      | sectionId | Status code | 
      | System    | 400         | 
  
   @Negative @ALM_421435 @Story:GLP-52463 @Regression
  Scenario Outline: To verify collectionDetails filter with invalid column names
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json"
      | description    | key                        | value            |
      | Random value   | extensions.sectionId       | Dynamic          | 
      | key from excel | extends.sources[0]._id     | productId        | 
      | key from excel | extends.sources[0]._bssVer | bssver           | 
      | key from excel | learningModel._id          | LearningModelid  | 
      | key from excel | learningModel._ver         | LearningModelver | 
      | key from excel | extends.sources[0]._ver    | productVersion   |   
      And the Get LE data should be available in "LEC" in couchbase "cluster1"    
    Given Set the endpoint for GET LE Collection
     When User send the request to GET LE collection with "<sectionId>" and "<collectionDetails>"
      And Verify the "<Status code>" code for LE collection 
    Examples: 
      | Status code | sectionId | collectionDetails | 
      | 400         | System    | _lastdate         | 
      

  @Negative @ALM_421436 @Story:GLP-52463 
  Scenario: To verify 405 method not allowed collectionDetails filter in GET LEC collection request when all is passed
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json"
      | description    | key                        | value            |
      | Random value   | extensions.sectionId       | Dynamic          | 
      | key from excel | extends.sources[0]._id     | productId        | 
      | key from excel | extends.sources[0]._bssVer | bssver           | 
      | key from excel | learningModel._id          | LearningModelid  | 
      | key from excel | learningModel._ver         | LearningModelver | 
      | key from excel | extends.sources[0]._ver    | productVersion   | 
      And the Get LE data should be available in "LEC" in couchbase "cluster1" 
     Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
  When I send the "PUT" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "updateStatus" with "application/json" and "sectionid" with queryparam
      | description    | key                        | value            |     
      |key to be update| previousState              | COMPOSED         | 
      | key to be update| TransitionState           | PUBLISHED        | 
  
     Then Server should return "405" Status for LE