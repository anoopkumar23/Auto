@GLOB-7
@Story:GLP-45267 
Feature: As a Tester I want to Validate the POST Update Learning Exp 


 @SchemaValidation
  Scenario Outline: Validate the Json Schema for POST Update Learning exp 
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json"
      | description    | key                        | value            |
      | Random value   | extensions.sectionId       | Dynamic          | 
      | key from excel | extends.sources[0]._id     | productId        | 
      | key from excel | extends.sources[0]._bssVer | bssver           | 
      | key from excel | learningModel._id          | LearningModelid  | 
      | key from excel | learningModel._ver         | LearningModelver | 
      | key from excel | extends.sources[0]._ver    | productVersion   | 
    Given set the endpoint for Update LE 
    When User send the request to update LE with "<LEID>"
      | expiresOn1   | label1  | tags1  | language1   | assetClass1  | objectives1  | _resourceType1   | _docType1   | _assetType1   | v_id   | v_bssVer   | v_ver   | _resourceType2   | category1   | data1  | resourcesmodel | _resourceType3   | category2   | data2  | coursetypemodel | _resourceType3  | category3   | data5  | COURSEAVATARmodel | label7  | resourceElementType8  | resourceRef1   | label9  | resourceElementType7  | resourceRef66  | label77 | resourceElementType66 | resourceRef55  | _resourceType44 | _docType33 | _assetType32 | s_id22   | s_bssVer33   | s_ver32   | 
      | <expiresOn1> | <label> | <tags> | <language1> | <assetClass> | <objectives> | <_resourceType1> | <_docType1> | <_assetType1> | <v_id> | <v_bssVer> | <v_ver> | <_resourceType2> | <category1> | <data> | <model1>       | <_resourceType3> | <category2> | <data> | <model2>        | <_resourceType> | <category3> | <data> | <model3>          | <label> | <resourceElementType> | <resourceRef1> | <label> | <resourceElementType> | <resourceRef2> | <label> | <resourceElementType> | <resourceRef3> | <_resourceType> | <_docType> | <_assetType> | <s_id22> | <s_bssVer33> | <s_ver32> | 
  
     Then Schema should validate for Update LE 
    Examples: 
      | Description           | expiresOn1                | label | tags | language1 | assetClass | objectives       | _resourceType1 | _docType1     | _assetType1        | v_id                                 | v_bssVer | v_ver                                | _resourceType2 | category1 | data  | model1      | _resourceType3 | category2 | data  | model2     | _resourceType | category3 | data | model3       | label | resourceElementType | resourceRef1 | label | resourceElementType | resourceRef2 | label | resourceElementType | resourceRef3 | _resourceType | _docType        | _assetType | s_id22                               | s_bssVer33 | s_ver32                              | STATUS | LEID   | 
      | Valid Message version | 2018-05-18T19:16:15+00:00 | REVEL | null | en        | Course     | objectivesString | LEARNINGASSET  | LEARNINGMODEL | LEARNINGEXPERIENCE | 68757a5d-c6c0-4d38-991b-dbea95e1a18b | 1        | 810a3768-17af-4f2f-9d4c-b07c6cdfc672 | INLINED        | narrative | REVEL | COURSETITLE | INLINED        | narrative | REVEL | COURSETYPE | INLINED       | image     | data | COURSEAVATAR | ""    | INLINED             | COURSETITLE  | label | INLINED             | COURSETYPE   | label | INLINED             | COURSEAVATAR | LEARNINGASSET | LEARNINGCONTENT | PRODUCT    | 33e9b95c-f78f-45df-9099-68ead2637f57 | 1          | b9b308e2-9b3e-4d66-9572-98045cffd5ed | 201    | System | 
  





@ALM_408620 @ALM_408628 @ALM_408644 @Positive @Smoke @Regression
Scenario Outline: : To Update Learning Experience for postive data 
  
  	Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json"
      | description    | key                        | value            |
      | Random value   | extensions.sectionId       | Dynamic          | 
      | key from excel | extends.sources[0]._id     | productId        | 
      | key from excel | extends.sources[0]._bssVer | bssver           | 
      | key from excel | learningModel._id          | LearningModelid  | 
      | key from excel | learningModel._ver         | LearningModelver | 
      | key from excel | extends.sources[0]._ver    | productVersion   | 
    Given set the endpoint for Update LE 
  
     When User send the request to update LE with "<LEID>"
  
      | expiresOn1   | label1  | tags1  | language1   | assetClass1  | objectives1  | _resourceType1   | _docType1   | _assetType1   | v_id   | v_bssVer   | v_ver   | _resourceType2   | category1   | data1  | resourcesmodel | _resourceType3   | category2   | data2  | coursetypemodel | _resourceType3  | category3   | data5  | COURSEAVATARmodel | label7  | resourceElementType8  | resourceRef1   | label9  | resourceElementType7  | resourceRef66  | label77 | resourceElementType66 | resourceRef55  | _resourceType44 | _docType33 | _assetType32 | s_id22   | s_bssVer33   | s_ver32   | 
      | <expiresOn1> | <label> | <tags> | <language1> | <assetClass> | <objectives> | <_resourceType1> | <_docType1> | <_assetType1> | <v_id> | <v_bssVer> | <v_ver> | <_resourceType2> | <category1> | <data> | <model1>       | <_resourceType3> | <category2> | <data> | <model2>        | <_resourceType> | <category3> | <data> | <model3>          | <label> | <resourceElementType> | <resourceRef1> | <label> | <resourceElementType> | <resourceRef2> | <label> | <resourceElementType> | <resourceRef3> | <_resourceType> | <_docType> | <_assetType> | <s_id22> | <s_bssVer33> | <s_ver32> | 
  
      And the Update LE data should be available in "LEC" in couchbase "cluster1"
  
     # Then Server should return "<STATUS>" status for LE 
  
    Examples: 
      | Description                | expiresOn1                | label | tags | language1 | assetClass | objectives       | _resourceType1 | _docType1     | _assetType1        | v_id                                 | v_bssVer | v_ver                                | _resourceType2 | category1 | data  | model1      | _resourceType3 | category2 | data  | model2     | _resourceType | category3 | data | model3       | label | resourceElementType | resourceRef1 | label | resourceElementType | resourceRef2 | label | resourceElementType | resourceRef3 | _resourceType | _docType        | _assetType | s_id22                               | s_bssVer33 | s_ver32                              | STATUS | LEID|
      | Valid Message version      | 2018-05-18T19:16:15+00:00 | REVEL | null | en        | Course     | objectivesString | LEARNINGASSET  | LEARNINGMODEL | LEARNINGEXPERIENCE | 68757a5d-c6c0-4d38-991b-dbea95e1a18b | 1        | 810a3768-17af-4f2f-9d4c-b07c6cdfc672 | INLINED        | narrative | REVEL | COURSETITLE | INLINED        | narrative | REVEL | COURSETYPE | INLINED       | image     | data | COURSEAVATAR | ""    | INLINED             | COURSETITLE  | label | INLINED             | COURSETYPE   | label | INLINED             | COURSEAVATAR | LEARNINGASSET | LEARNINGCONTENT | PRODUCT    | 33e9b95c-f78f-45df-9099-68ead2637f57 | 1          | b9b308e2-9b3e-4d66-9572-98045cffd5ed | 201    | System|
      | Empty non-mandatory fields | 2018-05-18T19:16:15+00:00 |       | null |           |            |                  | LEARNINGASSET  | LEARNINGMODEL | LEARNINGEXPERIENCE | 68757a5d-c6c0-4d38-991b-dbea95e1a18b | 1        | 810a3768-17af-4f2f-9d4c-b07c6cdfc672 | INLINED        | narrative | REVEL | COURSETITLE | INLINED        | narrative | REVEL | COURSETYPE | INLINED       | image     | data | COURSEAVATAR | ""    | INLINED             | COURSETITLE  | label | INLINED             | COURSETYPE   | label | INLINED             | COURSEAVATAR | LEARNINGASSET | LEARNINGCONTENT | PRODUCT    | 33e9b95c-f78f-45df-9099-68ead2637f57 | 1          | b9b308e2-9b3e-4d66-9572-98045cffd5ed | 201    | System|
  

@ALM_408630 @Positive @Smoke @Regression
  Scenario Outline: : To Update Learning Experience with all Enum Values 
  
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json"
      | description    | key                        | value            |
      | Random value   | extensions.sectionId       | Dynamic          | 
      | key from excel | extends.sources[0]._id     | productId        | 
      | key from excel | extends.sources[0]._bssVer | bssver           | 
      | key from excel | learningModel._id          | LearningModelid  | 
      | key from excel | learningModel._ver         | LearningModelver | 
      | key from excel | extends.sources[0]._ver    | productVersion   | 
    Given set the endpoint for Update LE 
  
     When User send the request to update LE with "<LEID>"
      | expiresOn1   | label1  | tags1  | language1   | assetClass1  | objectives1  | _resourceType1   | _docType1   | _assetType1   | v_id   | v_bssVer   | v_ver   | _resourceType2   | category1   | data1  | resourcesmodel | _resourceType3   | category2   | data2  | coursetypemodel | _resourceType3  | category3   | data5  | COURSEAVATARmodel | label7  | resourceElementType8  | resourceRef1   | label9  | resourceElementType7  | resourceRef66  | label77 | resourceElementType66 | resourceRef55  | _resourceType44 | _docType33 | _assetType32 | s_id22   | s_bssVer33   | s_ver32   | 
      | <expiresOn1> | <label> | <tags> | <language1> | <assetClass> | <objectives> | <_resourceType1> | <_docType1> | <_assetType1> | <v_id> | <v_bssVer> | <v_ver> | <_resourceType2> | <category1> | <data> | <model1>       | <_resourceType3> | <category2> | <data> | <model2>        | <_resourceType> | <category3> | <data> | <model3>          | <label> | <resourceElementType> | <resourceRef1> | <label> | <resourceElementType> | <resourceRef2> | <label> | <resourceElementType> | <resourceRef3> | <_resourceType> | <_docType> | <_assetType> | <s_id22> | <s_bssVer33> | <s_ver32> | 
     Then Server should return "<STATUS>" status for LE version
  
    Examples: 
      | Description                         | expiresOn1                | label | tags | language1 | assetClass | objectives       | _resourceType1 | _docType1     | _assetType1        | v_id                                 | v_bssVer | v_ver                                | _resourceType2 | category1 | data  | model1      | _resourceType3 | category2 | data  | model2     | _resourceType | category3 | data | model3       | label | resourceElementType | resourceRef1 | label | resourceElementType | resourceRef2 | label | resourceElementType | resourceRef3 | _resourceType | _docType        | _assetType | s_id22                               | s_bssVer33 | s_ver32                              | STATUS | LEID|
      | enum for resourceType=LEARNINGASSET | 2018-05-18T19:16:15+00:00 | REVEL | null | en        | Course     | objectivesString | LEARNINGASSET  | LEARNINGMODEL | LEARNINGEXPERIENCE | 68757a5d-c6c0-4d38-991b-dbea95e1a18b | 1        | 810a3768-17af-4f2f-9d4c-b07c6cdfc672 | INLINED        | narrative | REVEL | COURSETITLE | INLINED        | narrative | REVEL | COURSETYPE | INLINED       | image     | data | COURSEAVATAR | ""    | INLINED             | COURSETITLE  | label | INLINED             | COURSETYPE   | label | INLINED             | COURSEAVATAR | LEARNINGASSET | LEARNINGCONTENT | PRODUCT    | 33e9b95c-f78f-45df-9099-68ead2637f57 | 1          | b9b308e2-9b3e-4d66-9572-98045cffd5ed | 201    | System|
      | enum for resourceType=INCLINED      | 2018-05-18T19:16:15+00:00 | REVEL | null | en        | Course     | objectivesString | INCLINED       | LEARNINGMODEL | LEARNINGEXPERIENCE | 68757a5d-c6c0-4d38-991b-dbea95e1a18b | 1        | 810a3768-17af-4f2f-9d4c-b07c6cdfc672 | INLINED        | narrative | REVEL | COURSETITLE | INLINED        | narrative | REVEL | COURSETYPE | INLINED       | image     | data | COURSEAVATAR | ""    | INLINED             | COURSETITLE  | label | INLINED             | COURSETYPE   | label | INLINED             | COURSEAVATAR | LEARNINGASSET | LEARNINGCONTENT | PRODUCT    | 33e9b95c-f78f-45df-9099-68ead2637f57 | 1          | b9b308e2-9b3e-4d66-9572-98045cffd5ed | 201    | System|
      | enum for resourceType=CONTENT       | 2018-05-18T19:16:15+00:00 | REVEL | null | en        | Course     | objectivesString | CONTENT        | LEARNINGMODEL | LEARNINGEXPERIENCE | 68757a5d-c6c0-4d38-991b-dbea95e1a18b | 1        | 810a3768-17af-4f2f-9d4c-b07c6cdfc672 | INLINED        | narrative | REVEL | COURSETITLE | INLINED        | narrative | REVEL | COURSETYPE | INLINED       | image     | data | COURSEAVATAR | ""    | INLINED             | COURSETITLE  | label | INLINED             | COURSETYPE   | label | INLINED             | COURSEAVATAR | LEARNINGASSET | LEARNINGCONTENT | PRODUCT    | 33e9b95c-f78f-45df-9099-68ead2637f57 | 1          | b9b308e2-9b3e-4d66-9572-98045cffd5ed | 201    | System|
      | enum for contentCategory=narrative  | 2018-05-18T19:16:15+00:00 | REVEL | null | en        | Course     | objectivesString | CONTENT        | LEARNINGMODEL | LEARNINGEXPERIENCE | 68757a5d-c6c0-4d38-991b-dbea95e1a18b | 1        | 810a3768-17af-4f2f-9d4c-b07c6cdfc672 | INLINED        | narrative | REVEL | COURSETITLE | INLINED        | narrative | REVEL | COURSETYPE | INLINED       | image     | data | COURSEAVATAR | ""    | INLINED             | COURSETITLE  | label | INLINED             | COURSETYPE   | label | INLINED             | COURSEAVATAR | LEARNINGASSET | LEARNINGCONTENT | PRODUCT    | 33e9b95c-f78f-45df-9099-68ead2637f57 | 1          | b9b308e2-9b3e-4d66-9572-98045cffd5ed | 201    | System|
      | enum for contentCategory=audio      | 2018-05-18T19:16:15+00:00 | REVEL | null | en        | Course     | objectivesString | CONTENT        | LEARNINGMODEL | LEARNINGEXPERIENCE | 68757a5d-c6c0-4d38-991b-dbea95e1a18b | 1        | 810a3768-17af-4f2f-9d4c-b07c6cdfc672 | INLINED        | narrative | REVEL | COURSETITLE | INLINED        | narrative | REVEL | COURSETYPE | INLINED       | image     | data | COURSEAVATAR | ""    | INLINED             | COURSETITLE  | label | INLINED             | COURSETYPE   | label | INLINED             | COURSEAVATAR | LEARNINGASSET | LEARNINGCONTENT | PRODUCT    | 33e9b95c-f78f-45df-9099-68ead2637f57 | 1          | b9b308e2-9b3e-4d66-9572-98045cffd5ed | 201    | System|
      | enum for documentType=LEARNINGASSET | 2018-05-18T19:16:15+00:00 | REVEL | null | en        | Course     | objectivesString | CONTENT        | LEARNINGASSET | LEARNINGEXPERIENCE | 68757a5d-c6c0-4d38-991b-dbea95e1a18b | 1        | 810a3768-17af-4f2f-9d4c-b07c6cdfc672 | INLINED        | narrative | REVEL | COURSETITLE | INLINED        | narrative | REVEL | COURSETYPE | INLINED       | image     | data | COURSEAVATAR | ""    | INLINED             | COURSETITLE  | label | INLINED             | COURSETYPE   | label | INLINED             | COURSEAVATAR | LEARNINGASSET | LEARNINGCONTENT | PRODUCT    | 33e9b95c-f78f-45df-9099-68ead2637f57 | 1          | b9b308e2-9b3e-4d66-9572-98045cffd5ed | 201    | System|
  

@ALM_408640 @Positive @Smoke @Regression
  Scenario Outline: : To Update Learning Experience with all Data Types 
  
   Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json"
      | description    | key                        | value            |
      | Random value   | extensions.sectionId       | Dynamic          | 
      | key from excel | extends.sources[0]._id     | productId        | 
      | key from excel | extends.sources[0]._bssVer | bssver           | 
      | key from excel | learningModel._id          | LearningModelid  | 
      | key from excel | learningModel._ver         | LearningModelver | 
      | key from excel | extends.sources[0]._ver    | productVersion   | 
    Given set the endpoint for Update LE 
  
     When User send the request to update LE with "<LEID>"
      | expiresOn1   | label1  | tags1  | language1   | assetClass1  | objectives1  | _resourceType1   | _docType1   | _assetType1   | v_id   | v_bssVer   | v_ver   | _resourceType2   | category1   | data1  | resourcesmodel | _resourceType3   | category2   | data2  | coursetypemodel | _resourceType3  | category3   | data5  | COURSEAVATARmodel | label7  | resourceElementType8  | resourceRef1   | label9  | resourceElementType7  | resourceRef66  | label77 | resourceElementType66 | resourceRef55  | _resourceType44 | _docType33 | _assetType32 | s_id22   | s_bssVer33   | s_ver32   | 
      | <expiresOn1> | <label> | <tags> | <language1> | <assetClass> | <objectives> | <_resourceType1> | <_docType1> | <_assetType1> | <v_id> | <v_bssVer> | <v_ver> | <_resourceType2> | <category1> | <data> | <model1>       | <_resourceType3> | <category2> | <data> | <model2>        | <_resourceType> | <category3> | <data> | <model3>          | <label> | <resourceElementType> | <resourceRef1> | <label> | <resourceElementType> | <resourceRef2> | <label> | <resourceElementType> | <resourceRef3> | <_resourceType> | <_docType> | <_assetType> | <s_id22> | <s_bssVer33> | <s_ver32> | 
     Then Server should return "<STATUS>" status for LE version
  
    Examples: 
      | Description                   | expiresOn1                | label | tags | language1 | assetClass | objectives       | _resourceType1 | _docType1     | _assetType1        | v_id                                 | v_bssVer | v_ver                                | _resourceType2 | category1 | data  | model1      | _resourceType3 | category2 | data  | model2     | _resourceType | category3 | data | model3       | label | resourceElementType | resourceRef1 | label | resourceElementType | resourceRef2 | label | resourceElementType | resourceRef3 | _resourceType | _docType        | _assetType | s_id22                               | s_bssVer33 | s_ver32                              | STATUS | LEID|
      | dataType for ver=String       | 2018-05-18T19:16:15+00:00 | REVEL | null | en        | Course     | objectivesString | LEARNINGASSET  | LEARNINGMODEL | LEARNINGEXPERIENCE | 68757a5d-c6c0-4d38-991b-dbea95e1a18b | 1        | 810a3768-17af-4f2f-9d4c-b07c6cdfc672 | INLINED        | narrative | REVEL | COURSETITLE | INLINED        | narrative | REVEL | COURSETYPE | INLINED       | image     | data | COURSEAVATAR | ""    | INLINED             | COURSETITLE  | label | INLINED             | COURSETYPE   | label | INLINED             | COURSEAVATAR | LEARNINGASSET | LEARNINGCONTENT | PRODUCT    | 33e9b95c-f78f-45df-9099-68ead2637f57 | 1          | b9b308e2-9b3e-4d66-9572-98045cffd5ed | 201    | System|
      | dataType for bssver=String    | 2018-05-18T19:16:15+00:00 | REVEL | null | en        | Course     | objectivesString | INCLINED       | LEARNINGMODEL | LEARNINGEXPERIENCE | 68757a5d-c6c0-4d38-991b-dbea95e1a18b | 1        | 810a3768-17af-4f2f-9d4c-b07c6cdfc672 | INLINED        | narrative | REVEL | COURSETITLE | INLINED        | narrative | REVEL | COURSETYPE | INLINED       | image     | data | COURSEAVATAR | ""    | INLINED             | COURSETITLE  | label | INLINED             | COURSETYPE   | label | INLINED             | COURSEAVATAR | LEARNINGASSET | LEARNINGCONTENT | PRODUCT    | 33e9b95c-f78f-45df-9099-68ead2637f57 | 1          | b9b308e2-9b3e-4d66-9572-98045cffd5ed | 201    | System|
      | dataType for id=String        | 2018-05-18T19:16:15+00:00 | REVEL | null | en        | Course     | objectivesString | CONTENT        | LEARNINGMODEL | LEARNINGEXPERIENCE | 68757a5d-c6c0-4d38-991b-dbea95e1a18b | 1        | 810a3768-17af-4f2f-9d4c-b07c6cdfc672 | INLINED        | narrative | REVEL | COURSETITLE | INLINED        | narrative | REVEL | COURSETYPE | INLINED       | image     | data | COURSEAVATAR | ""    | INLINED             | COURSETITLE  | label | INLINED             | COURSETYPE   | label | INLINED             | COURSEAVATAR | LEARNINGASSET | LEARNINGCONTENT | PRODUCT    | 33e9b95c-f78f-45df-9099-68ead2637f57 | 1          | b9b308e2-9b3e-4d66-9572-98045cffd5ed | 201    | System|
      | dataType for resources=String | 2018-05-18T19:16:15+00:00 | REVEL | null | en        | Course     | objectivesString | CONTENT        | LEARNINGMODEL | LEARNINGEXPERIENCE | 68757a5d-c6c0-4d38-991b-dbea95e1a18b | 1        | 810a3768-17af-4f2f-9d4c-b07c6cdfc672 | INLINED        | narrative | REVEL | COURSETITLE | INLINED        | narrative | REVEL | COURSETYPE | INLINED       | image     | data | COURSEAVATAR | ""    | INLINED             | COURSETITLE  | label | INLINED             | COURSETYPE   | label | INLINED             | COURSEAVATAR | LEARNINGASSET | LEARNINGCONTENT | PRODUCT    | 33e9b95c-f78f-45df-9099-68ead2637f57 | 1          | b9b308e2-9b3e-4d66-9572-98045cffd5ed | 201    | System|
      | dataType for bssver=String    | 2018-05-18T19:16:15+00:00 | REVEL | null | en        | Course     | objectivesString | CONTENT        | LEARNINGMODEL | LEARNINGEXPERIENCE | 68757a5d-c6c0-4d38-991b-dbea95e1a18b | 1        | 810a3768-17af-4f2f-9d4c-b07c6cdfc672 | INLINED        | narrative | REVEL | COURSETITLE | INLINED        | narrative | REVEL | COURSETYPE | INLINED       | image     | data | COURSEAVATAR | ""    | INLINED             | COURSETITLE  | label | INLINED             | COURSETYPE   | label | INLINED             | COURSEAVATAR | LEARNINGASSET | LEARNINGCONTENT | PRODUCT    | 33e9b95c-f78f-45df-9099-68ead2637f57 | 1          | b9b308e2-9b3e-4d66-9572-98045cffd5ed | 201    | System|
  
#@ALM_408634 @ALM_408645 @ALM_408626 @Negative
#Scenario Outline: : To Update Learning Experience for negative data 
  
   # Given set the endpoint for POST LE
   # When User send the request to POST LE
   # Given Getting Learning Experience ID
   # Given set the endpoint for Update LE 
   # When User send the request to update LE with "<LEID>"
    #  | expiresOn1   | label1  | tags1  | language1   | assetClass1  | objectives1  | _resourceType1   | _docType1   | _assetType1   | v_id   | v_bssVer   | v_ver   | _resourceType2   | category1   | data1  | resourcesmodel | _resourceType3   | category2   | data2  | coursetypemodel | _resourceType3  | category3   | data5  | COURSEAVATARmodel | label7  | resourceElementType8  | resourceRef1   | label9  | resourceElementType7  | resourceRef66  | label77 | resourceElementType66 | resourceRef55  | _resourceType44 | _docType33 | _assetType32 | s_id22   | s_bssVer33   | s_ver32   | 
    #  | <expiresOn1> | <label> | <tags> | <language1> | <assetClass> | <objectives> | <_resourceType1> | <_docType1> | <_assetType1> | <v_id> | <v_bssVer> | <v_ver> | <_resourceType2> | <category1> | <data> | <model1>       | <_resourceType3> | <category2> | <data> | <model2>        | <_resourceType> | <category3> | <data> | <model3>          | <label> | <resourceElementType> | <resourceRef1> | <label> | <resourceElementType> | <resourceRef2> | <label> | <resourceElementType> | <resourceRef3> | <_resourceType> | <_docType> | <_assetType> | <s_id22> | <s_bssVer33> | <s_ver32> | 
   #  Then Server should return "<STATUS>" status for LE version
   #  Then Verify that "<errorMessage>" is valid in response
      
  # Examples: 
   #   | Description                     | expiresOn1                | label | tags | language1 | assetClass | objectives | _resourceType1 | _docType1       | _assetType1 | v_id                                 | v_bssVer | v_ver                                | _resourceType2 | category1 | data  | model1      | _resourceType3 | category2 | data  | model2     | _resourceType | category3 | data | model3       | label | resourceElementType | resourceRef1 | label | resourceElementType | resourceRef2 | label | resourceElementType | resourceRef3 | _resourceType | _docType        | _assetType | s_id22                               | s_bssVer33 | s_ver32                              | STATUS | errorMessage   | LEID   | 
   #   | Invalid date                    | 201e-05-18T19:16:15+00:00 | REVEL | null | en        | Course     | objectives | CONTENT        | LEARNINGPOLICY  | PRODUCT     | 68757a5d-c6c0-4d38-991b-dbea95e1a18b | 1        | 810a3768-17af-4f2f-9d4c-b07c6cdfc672 | INLINED        | narrative | REVEL | COURSETITLE | INLINED        | narrative | REVEL | COURSETYPE | INLINED       | image     | data | COURSEAVATAR | ""    | INLINED             | COURSETITLE  | label | INLINED             | COURSETYPE   | label | INLINED             | COURSEAVATAR | LEARNINGASSET | LEARNINGCONTENT | PRODUCT    | 33e9b95c-f78f-45df-9099-68ead2637f57 | 1          | b9b308e2-9b3e-4d66-9572-98045cffd5ed | 400    | Bad Request | System | 
   #   | Resource invalid Doc type       | 2018-05-18T19:16:15+00:00 | REVEL | null | en        | Course     | objectives | CONTENT        | LEARNINGPOLICY1 | PRODUCT     | null                                 | 1        | null                                 | INLINED1       | narrative | REVEL | COURSETITLE | INLINED        | narrative | REVEL | COURSETYPE | INLINED       | image     | data | COURSEAVATAR | ""    | INLINED             | COURSETITLE  | label | INLINED             | COURSETYPE   | label | INLINED             | COURSEAVATAR | LEARNINGASSET | LEARNINGCONTENT | PRODUCT    | 33e9b95c-f78f-45df-9099-68ead2637f57 | 1          | b9b308e2-9b3e-4d66-9572-98045cffd5ed | 400    | Bad Request | System | 
   #   | Invalid enum                    | 2018-05-18T19:16:15+00:00 | REVEL | null | en        | Course     | objectives | Pooja          | Abcd            | Efgh        | 68757a5d-c6c0-4d38-991b-dbea95e1a18b | 1        | 810a3768-17af-4f2f-9d4c-b07c6cdfc672 | INLINED        | invalid   | REVEL | COURSETITLE | INLINED        | narrative | REVEL | COURSETYPE | INLINED       | image     | data | COURSEAVATAR | ""    | INLINED             | COURSETITLE  | label | INLINED             | COURSETYPE   | label | INLINED             | COURSEAVATAR | LEARNINGASSET | LEARNINGCONTENT | PRODUCT    | 33e9b95c-f78f-45df-9099-68ead2637f57 | 1          | b9b308e2-9b3e-4d66-9572-98045cffd5ed | 400    | Bad Request | System | 
   #   | Ressource invalid Content       | 2018-05-18T19:16:15+00:00 | REVEL | null | en        | Course     | objectives | CONTENT1       | LEARNINGPOLICY  | PRODUCT     |                                      | 1        |                                      | INLINED        | narrative1| REVEL |             | INLINED        | narrative | REVEL | COURSETYPE | INLINED       | image     | data | COURSEAVATAR | ""    | INLINED             | COURSETITLE  | label | INLINED             | COURSETYPE   | label | INLINED             | COURSEAVATAR | LEARNINGASSET | LEARNINGCONTENT | PRODUCT    | 33e9b95c-f78f-45df-9099-68ead2637f57 | 1          | b9b308e2-9b3e-4d66-9572-98045cffd5ed | 400    | Bad Request | System | 
  

@ALM_408620 @Positive @Smoke @Couch-Base-Validation @Regression
  Scenario Outline: To check if the update version data available in Couchbase
  
  Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json"
      | description    | key                        | value            |
      | Random value   | extensions.sectionId       | Dynamic          | 
      | key from excel | extends.sources[0]._id     | productId        | 
      | key from excel | extends.sources[0]._bssVer | bssver           | 
      | key from excel | learningModel._id          | LearningModelid  | 
      | key from excel | learningModel._ver         | LearningModelver | 
      | key from excel | extends.sources[0]._ver    | productVersion   | 
    Given set the endpoint for Update LE 
  
     When User send the request to update LE with "<LEID>"
  
      | expiresOn1   | label1  | tags1  | language1   | assetClass1  | objectives1  | _resourceType1   | _docType1   | _assetType1   | v_id   | v_bssVer   | v_ver   | _resourceType2   | category1   | data1  | resourcesmodel | _resourceType3   | category2   | data2  | coursetypemodel | _resourceType3  | category3   | data5  | COURSEAVATARmodel | label7  | resourceElementType8  | resourceRef1   | label9  | resourceElementType7  | resourceRef66  | label77 | resourceElementType66 | resourceRef55  | _resourceType44 | _docType33 | _assetType32 | s_id22   | s_bssVer33   | s_ver32   | 
      | <expiresOn1> | <label> | <tags> | <language1> | <assetClass> | <objectives> | <_resourceType1> | <_docType1> | <_assetType1> | <v_id> | <v_bssVer> | <v_ver> | <_resourceType2> | <category1> | <data> | <model1>       | <_resourceType3> | <category2> | <data> | <model2>        | <_resourceType> | <category3> | <data> | <model3>          | <label> | <resourceElementType> | <resourceRef1> | <label> | <resourceElementType> | <resourceRef2> | <label> | <resourceElementType> | <resourceRef3> | <_resourceType> | <_docType> | <_assetType> | <s_id22> | <s_bssVer33> | <s_ver32> | 
  
      
  
      And the Update LE data should be available in "LEC" in couchbase "cluster1"
  
    Examples: 
      | Description           | expiresOn1                | label | tags | language1 | assetClass | objectives       | _resourceType1 | _docType1     | _assetType1        | v_id                                 | v_bssVer | v_ver                                | _resourceType2 | category1 | data  | model1      | _resourceType3 | category2 | data  | model2     | _resourceType | category3 | data | model3       | label | resourceElementType | resourceRef1 | label | resourceElementType | resourceRef2 | label | resourceElementType | resourceRef3 | _resourceType | _docType        | _assetType | s_id22                               | s_bssVer33 | s_ver32                              | STATUS | LEID   | 
      | Valid Message version | 2018-05-18T19:16:15+00:00 | REVEL | null | en        | Course     | objectivesString | LEARNINGASSET  | LEARNINGMODEL | LEARNINGEXPERIENCE | 68757a5d-c6c0-4d38-991b-dbea95e1a18b | 1        | 810a3768-17af-4f2f-9d4c-b07c6cdfc672 | INLINED        | narrative | REVEL | COURSETITLE | INLINED        | narrative | REVEL | COURSETYPE | INLINED       | image     | data | COURSEAVATAR | ""    | INLINED             | COURSETITLE  | label | INLINED             | COURSETYPE   | label | INLINED             | COURSEAVATAR | LEARNINGASSET | LEARNINGCONTENT | PRODUCT    | 33e9b95c-f78f-45df-9099-68ead2637f57 | 1          | 40a15757-5363-49d1-95e6-764fcbca25d8 | 201    | System | 
      
      
      
 @Negative @ALM_426083 
  Scenario: Validate the POST update Learning Experience version for invalid method GET
   Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
   When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json"
      | description    | key                        | value            |
      | Random value   | extensions.sectionId       | Dynamic          | 
      | key from excel | extends.sources[0]._id     | productId        | 
      | key from excel | extends.sources[0]._bssVer | bssver           | 
      | key from excel | learningModel._id          | LearningModelid  | 
      | key from excel | learningModel._ver         | LearningModelver | 
      | key from excel | extends.sources[0]._ver    | productVersion   | 
  
   
  Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_Update_Learning_Exp"
  When I send the "GET" request to "DomainURL/ENDPOINT_LEC_Publish_Learning_Exp" using request body as "updateVersion" with "application/json" and "leid"
      | description    | key                        | value            |     
       
  
     Then Server should return "405" Status for LE
  
      
      