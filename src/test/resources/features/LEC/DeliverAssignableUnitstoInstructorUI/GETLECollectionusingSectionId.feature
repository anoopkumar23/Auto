@GLOB-17
Feature: GET Learning Experience collection using sectionID

@SchemaValidation @ALM_421427 @ALM_415539 @Story:GLP-50324 @Story:GLP-52463
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
  

 @Smoke @Positive @ALM_421429  @Story:GLP-50324  @Regression
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
  

  @Smoke @Positive @ALM_421432  @Story:GLP-50324 @Regression
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
  

  @Smoke @Positive @ALM_421434 @Story:GLP-50324  @Regression
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
  

  @Negative @ALM_421431  @Story:GLP-50324 @Regression
  Scenario Outline: To Get Learning Experience Collection endpoint without any filter 
    Given Set the endpoint for GET LE Collection 
    When User sends the request with "<Method>" to GET LE collection
    And Verify the "<Status code>" code for LE collection
  
    Examples: 
     | Method | Status code | 
     | GET    | 400         | 
  
 @Negative @ALM_421430 @Story:GLP-50324 @Regression
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
      
      
#########Pagination and GET learning expeience collection without filters############## 
     
#Scenario Outline: Validate the Json Schema for GET Learning exp collection
#	Given Set the endpoint for GET LE Collection
#	When User sends the request with "<Method>" to GET LE collection 
#	Then Schema should validate for GET LE Collection 
# Examples: 
#            | Method| 
#            | GET   |

#@ALM_408650
#@Positive
#@Smoke @ALM_415532 @Story:GLP-50324
#Scenario Outline: To Get Learning Experience Collection 
#	Given Set the endpoint for GET LE Collection 
#	When User sends the request with "<Method>" to GET LE collection
#	And Verify the "<Status code>" code for LE collection
#	And Validate LE status coming as COMPOSED or PUBLISHED and "<size>"
#Examples: 
#     |Method    | Status code| size|
#     |GET       | 200        | 20  |

#@ALM_408651
#@Negative
#@Regressionvivek
#Scenario Outline: To Get Learning Experience Collection for negative data 1
#	When Set the endpoint for GET LE Collection with GarbledURL
#	And Verify the "<Status code>" code for LE collection

#Examples: 
#       | Status code| 
#       | 404        |

#@ALM_408651  	
#@Negative
#Scenario Outline: To Get Learning Experience Collection for negative data 2
#	Given Set the endpoint for GET LE Collection
#	When User sends the request with "<Method>" to GET LE collection
#	And Verify the "<Status code>" code for LE collection

#Examples: 
#        |Method    | Status code| 
#     	|POST      | 405        |     	

#@ALM_413020
#@ALM_413017
#@Positive
#@Smoke
#Scenario Outline: To Get Learning Experience Collection with pagination with positive values
#	Given Set the endpoint for GET LE Collection
#	When Send the request with "<limit>" and "<offset>"
#	And Verify the "<Status code>" code for LE collection
#	And Validate LE status coming as COMPOSED or PUBLISHED and "<size>"

#Examples: 
#  |Description               |offset        |limit | Status code| size |
#  | Limit greater than zero  | 0            | 50   |  200       | 50   |
#  | Positive offset value    | 10           | 5    |  200       | 5    |
#  | Zero offset              | 0            | 10   |  200       | 10   |                  

#@ALM_413019
#@Negative
#Scenario Outline: To Get Learning Experience Collection with pagination with negative values
#	Given Set the endpoint for GET LE Collection
#	When Send the request with "<limit>" and "<offset>"
#	And Verify the "<Status code>" code for LE collection
#	
#Examples: 
#      | Description                       | offset   | limit | Status code | 
#      | Negative offset value             | -2       | 9     | 400         | 
#      | Negative limit value              | 0        | -1    | 400         |     
#      | Limit greater than hundred        | 0        | 110   | 400         |       
#      | Offset in decimal                 | 10.0     | 50    | 400         |       
#      | Limit in decimal                  | 0        | 10.0  | 400         |       
#      | Offset greater than total records | 900000000| 5     | 200         |       
#      | Limit equal to zero               | 5        | 0     | 400         |       
#      | Blank limit                       | 0        |       | 400         |      
#      | Blank offset                      |          | 8     | 400         |       

#@ALM_413019       
#@Negative
#Scenario Outline: To Get Learning Experience Collection with pagination with negative values of keys
#	Given Set the endpoint for GET LE Collection
#	When Send the request with "<LIMIT>" and "<OFFSET>" keys in uppercase
#	And Verify the "<Status code>" code for LE collection

#Examples: 
#      | Description                       | OFFSET   | LIMIT | Status code | 
#      | Keys in Uppercase                 |  2       | 5     | 400         |        



#@ALM_417282
#Scenario Outline: To GET Learning Experience Collection using sectionId & verify next Link, previous link and self link persent in response & verify the count
#   Given set the endpoint for POST LE 
#    When User send the request to POST LE
#    Given Getting Learning Experience ID
#   And the Get LE data should be available in "LEC" in couchbase "cluster1"
#  Given Set the endpoint for GET LE Collection
#    When User send the request to GET LE collection with "<sectionId>" "<LIMIT>" "<OFFSET>"
#    And Verify the Next Link present in response with "<sectionId>" "<LIMIT>" "<OFFSET>"
#   And Verify the Previous Link present in response with "<sectionId>" "<LIMIT>" "<OFFSET>"
#    And Verify the Self Link present in response with "<sectionId>" "<LIMIT>" "<OFFSET>"
#    Then Verify the total number of count in response available in "LEC" in couchbase "cluster1"

#   Examples:

# |Description               |OFFSET        |LIMIT | Status code|sectionId|
# | Limit greater than zero  | 5            | 8    |  200       |System   |
# | Positive offset value    | 10           | 5    |  200       |System   |  

#@Negative
  #@ALM_417283
  #Scenario Outline: To GET Learning Experience Collection using valid sectionId where previous link should not present
  #  Given Set the endpoint for GET LE Collection
  #  When User send the request to GET LE collection with "<sectionId>" "<LIMIT>" "<OFFSET>"  
  #  And Verify the Previous Link not present in response with "<sectionId>" "<LIMIT>" "<OFFSET>"
  
  #  Examples:
  #|Description   |OFFSET        |LIMIT | Status code|sectionId|
  #|Offset zero   | 0            | 50   |  200       |System   |
  
  #@Negative
  #@ALM_417283
  #Scenario Outline: To GET Learning Experience Collection using valid sectionId where next link should not present
  # Given Set the endpoint for GET LE Collection
  # When User send the request to GET LE collection with "<sectionId>" "<LIMIT>" "<OFFSET>"
  # Then Verify the total number of count in response available in "LEC" in couchbase "cluster1"
  # And Verify the Next Link not present in response with "<sectionId>" "<LIMIT>" "<OFFSET>" 
  
  #   Examples:
  # |Description   |OFFSET    |LIMIT | Status code|sectionId|
  # |Offset zero   | 10       | 5   |  200        |System   |     