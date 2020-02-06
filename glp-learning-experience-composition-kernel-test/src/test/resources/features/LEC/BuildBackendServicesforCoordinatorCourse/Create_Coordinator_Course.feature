@GLOB-5
Feature: Build Backend Services for Coordinator Course

@tc:8
@SchemaValidation @Story:GLP-57360 @ALM_430117
  Scenario: GLP-FSR-SAeT_ENG_EC_CreateCoordinatorCourse_ValidateJson schema_TC001
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "COORDINATOR_COURSE" with "application/json"
      | description    | key                        | value                                   | 
      | Random value   | extensions.sectionId       | Dynamic                                 | 
      | key from excel | extends.sources[0]._id     | productId                               | 
      | key from excel | extends.sources[0]._bssVer | bssver                                  | 
      | key from excel | learningModel._id          |Coordinator_LearningModelid              | 
      | key from excel | learningModel._ver         | Coordinator_LearningModelver            | 
      | key from excel | extends.sources[0]._ver    | productVersion                          | 
     Then Schema should validate for POST LE 
  
@tc:9
  @GLOB-5 @Regression @Smoke @Positive @Story:GLP-57360 @ALM_430118 @Couchbase
  Scenario Outline: GLP-FSR-SAeT_ENG_EC_CreateCoordinatorCourse_Valid payloadwithvalidLearningModel_TC002
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "COORDINATOR_COURSE" with "application/json"
      | description    | key                        | value                        | 
      | Random value   | extensions.sectionId       | Dynamic                      | 
      | key from excel | extends.sources[0]._id     | productId                    | 
      | key from excel | extends.sources[0]._bssVer | bssver                       | 
      | key from excel | learningModel._id          | Coordinator_LearningModelid  | 
      | key from excel | learningModel._ver         | Coordinator_LearningModelver | 
      | key from excel | extends.sources[0]._ver    | productVersion               | 
  
     Then Server should return "201" Status for LE 
  
     Then I have the CouchBase response of query from "cluster1"
      
      And I should see following in the Couchbase response from "lec" as
      | Description | key     | value     | 
      | label       | label   | <label>   | 
      | _status     | _status | <_status> | 
    Examples: 
      | label | _status      | 
      | REVEL | PRE_COMPOSED | 
  
@tc:10
  @GLOB-5 @Regression @Positive @Story:GLP-57360 @ALM_430119 @Couchbase
  Scenario Outline: GLP-FSR-SAeT_ENG_EC_CreateCoordinatorCourse_WithBlank non mandatory field_TC003 
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "COORDINATOR_COURSE" with "application/json"
      | description      | key                        | value                        | 
      | Random value     | extensions.sectionId       | Dynamic                      | 
      | key from excel   | extends.sources[0]._id     | productId                    | 
      | key from excel   | extends.sources[0]._bssVer | bssver                       | 
      | key from excel   | learningModel._id          | Coordinator_LearningModelid  | 
      | key from excel   | learningModel._ver         | Coordinator_LearningModelver | 
      | key from excel   | extends.sources[0]._ver    | productVersion               | 
      | key to be update | <key>                      |      <value>                 |
      Then Server should return "201" Status for LE 
  
     Then I have the CouchBase response of query from "cluster1"
     
      And I should see following in the Couchbase response from "lec" as
      | Description | key     | value     |  
      | _status     | _status | <_status> |  
     Examples: 
      | key      | value |_status      |
      | label    |       |PRE_COMPOSED |
      | tags     |       |PRE_COMPOSED |
      | language |       |PRE_COMPOSED |
     
  
@tc:11
  @GLOB-5 @Regression @Negative @Story:GLP-57360 @ALM_430124
  Scenario Outline: GLP-FSR-SAeT_ENG_EC_CreateCoordinatorCourse_InvalidMandatoryfields_TC004
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "COORDINATOR_COURSE" with "application/json"
      | description      | key                        | value                        | 
      | Random value     | extensions.sectionId       | Dynamic                      | 
      | key from excel   | extends.sources[0]._id     | productId                    | 
      | key from excel   | extends.sources[0]._bssVer | bssver                       | 
      | key to be update | <key>                      |      <value>                 |  
      | key from excel   | extends.sources[0]._ver    | productVersion               | 
     Then Server should return "400" Status for LE  
   Examples: 
      | key                                  | value                                | 
      | learningModel._id                    | 4eeac9bf-806a-4a3e-9cfd-c29b297f3814 | 
      | learningModel._ver                   | 4eeac9bf-806a-4a3e-9cfd-c29b297f3824 | 
      | learningModel._bssVer                | 5                                    | 
      | resources.COURSETITLE._resourceType  | CONTENT                              | 
      | resources.COURSETITLE.category       | CONTENT                              | 
      | resources.COURSETYPE._resourceType   | CONTENT                              | 
      | resources.COURSETYPE.category        | CONTENT                              | 
      | resources.COURSEAVATAR._resourceType | CONTENT                              | 
      | resources.COURSEAVATAR.category      | CONTENT                              | 
      
@tc:12
  @GLOB-5 @Regression @Negative @Story:GLP-57360 @ALM_430125
  Scenario Outline: GLP-FSR-SAeT_ENG_EC_CreateCoordinatorCourse_WithNull mandatory field_TC005
   Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "COORDINATOR_COURSE" with "application/json"
      | description      | key                        | value                        | 
      | Random value     | extensions.sectionId       | Dynamic                      | 
      | key from excel   | extends.sources[0]._id     | productId                    | 
      | key from excel   | extends.sources[0]._bssVer | bssver                       | 
      | key to be update | <key>                      |      <value>                 | 
      | key from excel   | extends.sources[0]._ver    | productVersion               | 
     Then Server should return "400" Status for LE  
   Examples: 
      | key                                  | value | 
      | learningModel._id                    | null  | 
      | learningModel._ver                   | null  | 
      | learningModel._bssVer                | null  | 
      | resources.COURSETITLE._resourceType  | null  | 
      | resources.COURSETITLE.category       | null  | 
      | resources.COURSETYPE._resourceType   | null  | 
      | resources.COURSETYPE.category        | null  | 
      | resources.COURSEAVATAR._resourceType | null  | 
      | resources.COURSEAVATAR.category      | null  | 
  
@tc:13
  @GLOB-5 @Regression @Negative @Story:GLP-57360 @ALM_430127
  Scenario Outline: GLP-FSR-SAeT_ENG_EC_CreateCoordinatorCourse_WithInvalid enum_TC006
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "COORDINATOR_COURSE" with "application/json"
      | description      | key                        | value                        | 
      | Random value     | extensions.sectionId       | Dynamic                      | 
      | key from excel   | extends.sources[0]._id     | productId                    | 
      | key from excel   | extends.sources[0]._bssVer | bssver                       | 
      | key to be update | <key>                      |      <value>                 | 
      | key from excel   | learningModel._ver         | Coordinator_LearningModelver | 
      | key from excel   | extends.sources[0]._ver    | productVersion               | 
     Then Server should return "400" Status for LE  
   Examples: 
      | key                                  | value                                | 
      | resources.COURSETITLE._resourceType  | CONTENT                              | 
      | resources.COURSETITLE.category       | CONTENT                              | 
      | resources.COURSETYPE._resourceType   | CONTENT                              | 
      | resources.COURSETYPE.category        | CONTENT                              | 
      | resources.COURSEAVATAR._resourceType | CONTENT                              | 
      | resources.COURSEAVATAR.category      | CONTENT                              | 
     
@tc:14
     @GLOB-5 @Regression @Negative @Story:GLP-57360 @ALM_430129
  Scenario: GLP-FSR-SAeT_ENG_EC_CreateCoordinatorCourse_WithInvalidValuesInSources_TC007
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST"
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "COORDINATOR_COURSE" with "application/json"
      | description      | key                        | value                                   | 
      | Random value     | extensions.sectionId       | Dynamic                                 | 
      | key to be update | extends.sources[0]._id     | productId                               | 
      | key from excel   | extends.sources[0]._bssVer | bssver                                  | 
      | key from excel   | learningModel._id          | Coordinator_LearningModelid             | 
      | key from excel   | learningModel._ver         | Coordinator_LearningModelver            | 
      | key from excel   | extends.sources[0]._ver    | productVersion                          | 
     Then Server should return "400" Status for LE  
     
  
