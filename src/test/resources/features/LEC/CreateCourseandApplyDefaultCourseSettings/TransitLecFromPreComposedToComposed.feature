@Story:GLP-47953 @GLOB-7
Feature: As a Tester I want to Transit LEC From Pre Composed To Composed
@ALM_404803 @ALM_404801 @Smoke @Positive @Regression
 Scenario Outline: : To Post Learning Experience to fetch id
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json"
      | description    | key                        | value            |
      | Random value   | extensions.sectionId       | Dynamic          | 
      | key from excel | extends.sources[0]._id     | productId        | 
      | key from excel | extends.sources[0]._bssVer | bssver           | 
      | key from excel | learningModel._id          | LearningModelid  | 
      | key from excel | learningModel._ver         | LearningModelver | 
      | key from excel | extends.sources[0]._ver    | productVersion   | 
      
     And the Update LE version data should be available in "_status" in couchbase "cluster1"

      Examples: 
      | Description                | expiresOn1                | label | tags | language1 | assetClass | objectives       | _resourceType1 | _docType1      | _assetType1        | v_id                                 | v_bssVer | v_ver                                | _resourceType2 | category1 | data  | model1      | _resourceType3 | category2 | data  | model2     | _resourceType | category3 | data | model3       | label | resourceElementType | resourceRef1 | label | resourceElementType | resourceRef2 | label | resourceElementType | resourceRef3 | _resourceType | _docType        | _assetType | s_id22                               | s_bssVer33 | s_ver32                              | STATUS | LEID|
      | Valid Message version      | 2018-05-18T19:16:15+00:00 | REVEL | null | en        | Course     | objectivesString | LEARNINGASSET  | LEARNINGMODEL  | LEARNINGEXPERIENCE | 68757a5d-c6c0-4d38-991b-dbea95e1a18b | 1        | 810a3768-17af-4f2f-9d4c-b07c6cdfc672 | INLINED        | narrative | REVEL | COURSETITLE | INLINED        | narrative | REVEL | COURSETYPE | INLINED       | image     | data | COURSEAVATAR | ""    | INLINED             | COURSETITLE  | label | INLINED             | COURSETYPE   | label | INLINED             | COURSEAVATAR | LEARNINGASSET | LEARNINGCONTENT | PRODUCT    | 33e9b95c-f78f-45df-9099-68ead2637f57 | 1          | 40a15757-5363-49d1-95e6-764fcbca25d8 | 201    |  System|
