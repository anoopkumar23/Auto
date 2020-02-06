@GLOB-38 @Story:GLP-52156  @Story:GLP-52157
Feature: As a Tester I want to Validate the Get Learning Experience Collection based on AssetClass & Scope Tags

@ALM_422936 @SchemaValidation 
#@Smoke
Scenario Outline: Validate the json Schema for GET Learning exp collection based on AssetClass & Scope Tags
	
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
	Given Set the endpoint for GET LE Collection based on AssetClass & Scope Tags
	When User sends the request with "<assetClass>" and "<scope.assets._id>" and "<scope.assets._bssVer>" and "<collectionDetails>" to GET LE collection 
	Then Schema should validate for GET LE Collection based on AssetClass & Scope Tags
	And Verify the "<StatusCode>" code for GET LE collection based on AssetClass & Scope Tags
	
 Examples: 
            | assetClass | scope.assets._id          | scope.assets._bssVer |collectionDetails         |StatusCode  |LEID|
            | ASSIGNMENT | Dynamic1                  | Dynamic2             |  _created                |200         |System|

@ALM_422937 @Positive @Regression @Smoke
Scenario Outline: Validate the response for GET Learning exp collection based on AssetClass & Scope Tags when valid values are passed in query parameters
	
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
	Given Set the endpoint for GET LE Collection based on AssetClass & Scope Tags
	When User sends the request with "<assetClass>" and "<scope.assets._id>" and "<scope.assets._bssVer>" and "<collectionDetails>" to GET LE collection 
	And Validate LE status coming as PRE_COMPOSED
	And Verify the "<StatusCode>" code for GET LE collection based on AssetClass & Scope Tags
	And verify the assignment id present in response
	
 Examples: 
            | assetClass | scope.assets._id          | scope.assets._bssVer |collectionDetails         |StatusCode  |LEID|
            | ASSIGNMENT | Dynamic1                  | Dynamic2             |  _created,language       |200         |System|


@ALM_422938 @Negative @Regression           
Scenario Outline: Validate the response for GET Learning exp collection based on AssetClass & Scope Tags with invalid courseID(UUID)
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
	Given Set the endpoint for GET LE Collection based on AssetClass & Scope Tags
	When User sends the request with "<assetClass>" and "<scope.assets._id>" and "<scope.assets._bssVer>" and "<collectionDetails>" to GET LE collection  
	And Verify that blank LE array with "<count>" is returned in response
	And Verify the "<StatusCode>" code for GET LE collection based on AssetClass & Scope Tags
 Examples: 
  |Description                     | assetClass | scope.assets._id                      | scope.assets._bssVer |collectionDetails | count |StatusCode  |LEID|
  |Invalid courseID in UUID format | ASSIGNMENT | 3cbc9a37-d208-499b-93ff-1749bf0d0d38  | Dynamic2             |_created          |   0   |200         |System|
  |Invalid bssVer                  | ASSIGNMENT | Dynamic1                              | 1000                 |_created          |   0   |200         |System|
 
@ALM_422939 @Negative @Regression
Scenario Outline: Validate the response for GET Learning exp collection based on AssetClass & Scope Tags with blank or null or invalid ID and bssversion
    
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
	Given Set the endpoint for GET LE Collection based on AssetClass & Scope Tags
	When User sends the request with "<assetClass>" and "<scope.assets._id>" and "<scope.assets._bssVer>" and "<collectionDetails>" to GET LE collection 
	And Verify the "<StatusCode>" code for GET LE collection based on AssetClass & Scope Tags
 Examples: 
  |Description                | assetClass | scope.assets._id      | scope.assets._bssVer |collectionDetails          |StatusCode  |LEID|
  |Invalid course ID          | ASSIGNMENT | Invalid               |   Dynamic2           |_created                   |400         |System|           
  |Invalid course bssversion  | ASSIGNMENT | Dynamic1              |  Invalid             |_created                   |400         | System|
  |Blank course ID            | ASSIGNMENT |                       |  Dynamic2            |_created                   |400         | System|  
  |Blank course bssVersion    | ASSIGNMENT |   Dynamic1            |                      |_created                   |400         |System|
  |Null course ID             | ASSIGNMENT |    null               |    Dynamic2          |_created                   |400         | System|    
  |Null course bssversion     | ASSIGNMENT |   Dynamic1            |        null          |_created                   |400         | System|

@ALM_422940 @Negative @Regression
Scenario Outline: Validate the response for GET Learning exp collection based on AssetClass & Scope Tags with invalid assetclass
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
	Given Set the endpoint for GET LE Collection based on AssetClass & Scope Tags
	When User sends the request with "<assetClass>" and "<scope.assets._id>" and "<scope.assets._bssVer>" and "<collectionDetails>" to GET LE collection 
	And Verify the "<StatusCode>" code for GET LE collection based on AssetClass & Scope Tags
 Examples: 
  |Description            | assetClass | scope.assets._id          | scope.assets._bssVer |collectionDetails |StatusCode  |LEID|
  |Invalid AssetClass     | COURSE     | Dynamic1                  |  Dynamic2           | _created          | 400        | System|        
  |Invalid AssetClass     | Invalid    | Dynamic1                  | Dynamic2            | _created          | 400        | Sytem|
  
 

  

##Feature: As a Tester I want to Validate the API contract of Get Learning Experience Collection based on AssetClass & Scope Tags
@Stub @SchemaValidation @ALM_421655 @Positive
Scenario Outline: Validate the Json Schema for GET Learning exp collection based on AssetClass & Scope Tags with valid query parameters
	
	Given Set the endpoint api contract for GET LE Collection based on AssetClass & Scope Tags
	When User sends the request with "<assetClass>" and "<scopeassetsId>" and "<scopeassetsbssVer>" to GET LE collection api contract
	Then Schema should validate for api contract of GET LE Collection based on AssetClass & Scope Tags
	And Verify the "<StatusCode>" code of api contract for GET LE collection based on AssetClass & Scope Tags
	
 Examples: 
 |Description           | assetClass | scopeassetsId                          | scopeassetsbssVer |StatusCode  |LEID|
 |Valid values          | ASSIGNMENT | e5c9c124-1a51-4466-b9cb-9a3107185c2a   |    1              |200         |System|
 |Valid values          | ASSIGNMENT | e5c9c124-1a51-4466-b9cb-9a3107189c2a   |    5              |200         |System|
             

@ALM_421656   @Negative @Stub     
Scenario Outline: Validate GET Learning exp collection based on AssetClass & Scope Tags with invalid query parameters values
	
	Given Set the endpoint api contract for GET LE Collection based on AssetClass & Scope Tags
	When User sends the request with "<assetClass>" and "<scopeassetsId>" and "<scopeassetsbssVer>" to GET LE collection api contract
	And Verify the "<StatusCode>" code of api contract for GET LE collection based on AssetClass & Scope Tags
Examples: 
 |Description             | assetClass | scopeassetsId             | scopeassetsbssVer    |StatusCode     |LEID|
 |Invalid ID              | ASSIGNMENT |   uxz89ooss               |   4                  |404            | System|
