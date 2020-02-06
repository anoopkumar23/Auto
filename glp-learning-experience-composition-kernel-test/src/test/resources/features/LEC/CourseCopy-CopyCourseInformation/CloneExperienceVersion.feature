@GLOB-80 
Feature: As a Tester I want to Validate the clone learning experience version 

@Story:GLP-57288 @Story:GLP-64948 @ALM_433615 @Positive @Smoke @Regression 
  Scenario Outline:GLP-FSR-SAeT_ENG_EC_CloneLearningExperience_Course_Version_WithValidSectionId_Shallow_TC001 
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
  
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_CLONE_VERSIONS" 
     When I send "post" request with LEID and "<sectionId>" to "DomainURL/ENDPOINT_LEC_CLONE_VERSIONS" using request body as "CloneLearningExperienceVersion" with "application/json" using Shallow 
      | description | key | value | 
      And Verify the response which is found in clone learning experience version 
     Then Server should return "201" Status for LE 
    Examples: 
      | sectionId | 
      | Valid     | 
  @Story:GLP-57288 @ALM_433616 @Negative @Regression 
  Scenario Outline:GLP-FSR-SAeT_ENG_EC_CloneLearningExperience_Course_Version_WithValidSectionId_DEEP_TC002 
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
  
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_CLONE_VERSIONS" 
     When I send "post" request with LEID and "<sectionId>" to "DomainURL/ENDPOINT_LEC_CLONE_VERSIONS" using request body as "CloneLearningExperienceVersion" with "application/json" using Deep 
     Then Server should return "400" Status for LE 
    Examples: 
      | sectionId | 
      | Valid     | 
  
  @Story:GLP-57288 @ALM_433617 @Negative @Regression 
  Scenario Outline:GLP-FSR-SAeT_ENG_EC_CloneLearningExperience_Course_Version_WithInValidLEID_SHALLOW_TC003 
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
  
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_CLONE_VERSIONS" 
     When I send "post" request with "<LEID>" and "<sectionId>" to "DomainURL/ENDPOINT_LEC_CLONE_VERSIONS" using request body as "CloneLearningExperienceVersion" with "application/json" using Deep 
     Then Server should return "400" Status for LE 
    Examples: 
      | sectionId | LEID    | 
      | Valid     | Invalid | 
  
  @Story:GLP-57288 @ALM_433618 @Negative @Regression 
  Scenario Outline:GLP-FSR-SAeT_ENG_EC_CloneLearningExperience_Course_Version_WithInValidSectionId_Shallow_TC004 
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
  
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_CLONE_VERSIONS" 
     When I send "post" request with LEID and "<sectionId>" to "DomainURL/ENDPOINT_LEC_CLONE_VERSIONS" using request body as "CloneLearningExperienceVersion" with "application/json" using Shallow 
      | description | key | value | 
     Then Server should return "400" Status for LE 
    Examples: 
      | sectionId | 
      | invalid   | 
  
  @Story:GLP-57288 @ALM_433619 @Negative @Regression 
  Scenario Outline:GLP-FSR-SAeT_ENG_EC_CloneLearningExperience_Course_Version_WithBlankSectionId_Shallow_TC005 
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
  
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_CLONE_VERSIONS" 
     When I send "post" request with LEID and "<sectionId>" to "DomainURL/ENDPOINT_LEC_CLONE_VERSIONS" using request body as "CloneLearningExperienceVersion" with "application/json" using Shallow 
      | description | key | value | 
     Then Server should return "400" Status for LE 
    Examples: 
      | sectionId | 
      | blank     | 
  @Story:GLP-57288 @ALM_433620 @Positive @Regression 
  Scenario Outline:GLP-FSR-SAeT_ENG_EC_CloneLearningExperience_Course_Version_MissingNonMandatoryFieldInValue_TC006 
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
  
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_CLONE_VERSIONS" 
     When I send "post" request with LEID and "<sectionId>" to "DomainURL/ENDPOINT_LEC_CLONE_VERSIONS" using request body as "CloneLearningExperienceVersion" with "application/json" using Shallow 
      | description      | key        | value | 
      | key to be remove | patches[4] |       | 
  
     Then Server should return "201" Status for LE 
    Examples: 
      | sectionId | 
      | dontsend  | 
  
  @Story:GLP-57288 @ALM_433621 @SchemaValidation 
  Scenario Outline:GLP-FSR-SAeT_ENG_EC_CloneLearningExperience_version_json schema validation_TC007 
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
  
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_CLONE_VERSIONS" 
     When I send "post" request with LEID and "<sectionId>" to "DomainURL/ENDPOINT_LEC_CLONE_VERSIONS" using request body as "CloneLearningExperienceVersion" with "application/json" using Shallow 
      | description | key | value | 
     Then Server should return "201" Status for LE 
     Then Schema should validate for Clone Learning Experience Version 
    Examples: 
      | sectionId | 
      | Valid     | 
  
  @Story:GLP-57288 @ALM_433622 @Negative @Regression 
  Scenario Outline:GLP-FSR-SAeT_ENG_EC_CloneLearningExperience_version_missingMandatoryFields_TC008 
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
  
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_CLONE_VERSIONS" 
     When I send "post" request with LEID and sectionId with "<Category>" to "DomainURL/ENDPOINT_LEC_CLONE_VERSIONS" using request body as "CloneLearningExperienceVersion" with "application/json" using Shallow 
     Then Server should return "400" Status for LE 
    Examples: 
      | Category | 
      | blank    | 
  
  @Story:GLP-57288 @ALM_433623 @Negative @Regression 
  Scenario Outline:GLP-FSR-SAeT_ENG_EC_CloneLearningExperience_version_InvalidEnum_TC009 
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
  
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_CLONE_VERSIONS" 
     When I send "post" request with LEID and sectionId with "<Category>" to "DomainURL/ENDPOINT_LEC_CLONE_VERSIONS" using request body as "CloneLearningExperienceVersion" with "application/json" using Shallow 
     Then Server should return "400" Status for LE 
    Examples: 
      | Category | 
      | invalid  | 
  
  ##############################################################################################################################
  #Clone Learning Experience Version Updated#
  ##############################################################################################################################
  
  @Story:GLP-62674 @Story:GLP-64948 @Story:GLP-60857 @ALM_442010 @Positive
  @Regression @Smoke 
  Scenario Outline:GLP-FSR-SAeT_ENG_EC_CloneLearningExperience_Assignment_Version_Add_Assignment_Message_Patch_TC001 
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST" 
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json" 
      | description    | key                        | value            | 
      | Random value   | extensions.sectionId       | Dynamic          | 
      | key from excel | extends.sources[0]._id     | productId        | 
      | key from excel | extends.sources[0]._bssVer | bssver           | 
      | key from excel | learningModel._id          | LearningModelid  | 
      | key from excel | learningModel._ver         | LearningModelver | 
      | key from excel | extends.sources[0]._ver    | productVersion   | 
  
  #When send the request with "<LEID>" 
     When I send the "post" request "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperienceAssignment" with "application/json" 
      | description                    | key                                                      | value                           | 
      | key from excel                 | learningModel._id                                        | Assignment_LearningModelid      | 
      | key from excel                 | learningModel._ver                                       | Assignment_LearningModelver     | 
      | key from excel                 | learningModel._bssVer                                    | Assignment_LearningModelVersion | 
      | Id from create Course          | scope.assets[0]._id                                      | dynamic                         | 
      | version from create Course     | scope.assets[0]._ver                                     | dynamic                         | 
      | bss version from create Course | scope.assets[0]._bssVer                                  | dynamic                         | 
      | key to be remove               | resources.STDNT-MSG-51b84752-1614-4ddd-ad7a-f488f165b663 |                                 | 
      | key to be remove               | resourcePlan[1]                                          |                                 | 
     Then Server should return "201" Status for LE 
  
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_CLONE_VERSIONS" 
     When I send the "post" request with Assignment LEID and clone Type to "DomainURL/ENDPOINT_LEC_CLONE_VERSIONS" using request body as "addCloneExperienceAssignmentVersion" with "application/json" using <type> 
      | description      | key                           | value                     | 
      | key to be update | patches[1].op                 | add                       | 
      | key to be update | patches[1].value.data.message | This is the Added Message | 
  
     Then Server should return "201" Status for LE 
      And Verify the response which is found in clone learning experience "<AssetClass>" with patch 
      | key        | value      | 
      | AssetClass | ASSIGNMENT | 
      And Validate "<Patch>" in "LEC" in couchbase "cluster1" with 
      | key     | value                     | 
      | message | This is the Added Message | 
      | type    | ASSIGNMENT                | 
  
    Examples: 
      | type    | Patch     | AssetClass | 
      | SHALLOW | Add Patch | ASSIGNMENT | 
  
  @Story:GLP-62674 @Story:GLP-64948 @Story:GLP-60857 @ALM_442011 @Positive
  @Regression @Smoke 
  Scenario Outline:GLP-FSR-SAeT_ENG_EC_CloneLearningExperience_Assignment_Version_Remove_Assignment_Message_Patch_TC002 
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST" 
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json" 
      | description    | key                        | value            | 
      | Random value   | extensions.sectionId       | Dynamic          | 
      | key from excel | extends.sources[0]._id     | productId        | 
      | key from excel | extends.sources[0]._bssVer | bssver           | 
      | key from excel | learningModel._id          | LearningModelid  | 
      | key from excel | learningModel._ver         | LearningModelver | 
      | key from excel | extends.sources[0]._ver    | productVersion   | 
  
  #When send the request with "<LEID>" 
     When I send the "post" request "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperienceAssignment" with "application/json" 
      | description                    | key                     | value                           | 
      | key from excel                 | learningModel._id       | Assignment_LearningModelid      | 
      | key from excel                 | learningModel._ver      | Assignment_LearningModelver     | 
      | key from excel                 | learningModel._bssVer   | Assignment_LearningModelVersion | 
      | Id from create Course          | scope.assets[0]._id     | dynamic                         | 
      | version from create Course     | scope.assets[0]._ver    | dynamic                         | 
      | bss version from create Course | scope.assets[0]._bssVer | dynamic                         | 
  
     Then Server should return "201" Status for LE 
  
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_CLONE_VERSIONS" 
     When I send the "post" request with Assignment LEID and clone Type to "DomainURL/ENDPOINT_LEC_CLONE_VERSIONS" using request body as "CloneExperienceAssignmentVersion" with "application/json" using <type> 
      | description      | key             | value                                                                  | 
      | key to be update | patches[1].op   | remove                                                                 | 
      | key to be update | patches[1].path | /resources/STDNT-MSG-51b84752-1614-4ddd-ad7a-f488f165b663/data/message | 
     Then Server should return "201" Status for LE 
      And Verify the response which is found in clone learning experience "<AssetClass>" with patch 
      | key        | value      | 
      | AssetClass | ASSIGNMENT | 
      And Validate "<Patch>" in "LEC" in couchbase "cluster1" with 
      | key  | value      | 
      | type | ASSIGNMENT | 
  
    Examples: 
      | type    | Patch        | AssetClass | 
      | SHALLOW | Remove Patch | ASSIGNMENT | 
  
  @Story:GLP-62674 @Story:GLP-64948 @Story:GLP-60857 @ALM_442013 @Positive
  @Regression @Smoke 
  Scenario Outline:GLP-FSR-SAeT_ENG_EC_CloneLearningExperience_Assignment_Version_Update_Assignment_Title_Patch_TC004 
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST" 
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json" 
      | description    | key                        | value            | 
      | Random value   | extensions.sectionId       | Dynamic          | 
      | key from excel | extends.sources[0]._id     | productId        | 
      | key from excel | extends.sources[0]._bssVer | bssver           | 
      | key from excel | learningModel._id          | LearningModelid  | 
      | key from excel | learningModel._ver         | LearningModelver | 
      | key from excel | extends.sources[0]._ver    | productVersion   | 
  
  #When send the request with "<LEID>" 
     When I send the "post" request "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperienceAssignment" with "application/json" 
      | description                    | key                     | value                           | 
      | key from excel                 | learningModel._id       | Assignment_LearningModelid      | 
      | key from excel                 | learningModel._ver      | Assignment_LearningModelver     | 
      | key from excel                 | learningModel._bssVer   | Assignment_LearningModelVersion | 
      | Id from create Course          | scope.assets[0]._id     | dynamic                         | 
      | version from create Course     | scope.assets[0]._ver    | dynamic                         | 
      | bss version from create Course | scope.assets[0]._bssVer | dynamic                         | 
  
     Then Server should return "201" Status for LE 
  
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_CLONE_VERSIONS" 
     When I send the "post" request with Assignment LEID and clone Type to "DomainURL/ENDPOINT_LEC_CLONE_VERSIONS" using request body as "CloneExperienceAssignmentVersion" with "application/json" using <type> 
      | description      | key                   | value                                 | 
      | key to be update | patches[0].op         | replace                               | 
      | key to be update | patches[0].path       | /resources/ASSIGNMENTTITLE            | 
      | key to be update | patches[0].value.data | This is the Replaced Assignment Title | 
     Then Server should return "201" Status for LE 
      And Verify the response which is found in clone learning experience "<AssetClass>" with patch 
      | key        | value      | 
      | AssetClass | ASSIGNMENT | 
      And Validate "<Patch>" in "LEC" in couchbase "cluster1" with 
      | key     | value                                 | 
      | message | This is the Replaced Assignment Title | 
      | type    | ASSIGNMENT                            | 
  
    Examples: 
      | type    | Patch              | AssetClass | 
      | SHALLOW | Update Title Patch | ASSIGNMENT | 
  
  @Story:GLP-62674 @Story:GLP-64948 @Story:GLP-60857 @ALM_442012 @Positive
  @Regression @Smoke 
  Scenario Outline:GLP-FSR-SAeT_ENG_EC_CloneLearningExperience_Assignment_Version_Update_Assignment_Message_Patch_TC003 
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST" 
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json" 
      | description    | key                        | value            | 
      | Random value   | extensions.sectionId       | Dynamic          | 
      | key from excel | extends.sources[0]._id     | productId        | 
      | key from excel | extends.sources[0]._bssVer | bssver           | 
      | key from excel | learningModel._id          | LearningModelid  | 
      | key from excel | learningModel._ver         | LearningModelver | 
      | key from excel | extends.sources[0]._ver    | productVersion   | 
  
  #When send the request with "<LEID>" 
     When I send the "post" request "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperienceAssignment" with "application/json" 
      | description                    | key                     | value                           | 
      | key from excel                 | learningModel._id       | Assignment_LearningModelid      | 
      | key from excel                 | learningModel._ver      | Assignment_LearningModelver     | 
      | key from excel                 | learningModel._bssVer   | Assignment_LearningModelVersion | 
      | Id from create Course          | scope.assets[0]._id     | dynamic                         | 
      | version from create Course     | scope.assets[0]._ver    | dynamic                         | 
      | bss version from create Course | scope.assets[0]._bssVer | dynamic                         | 
  
     Then Server should return "201" Status for LE 
  
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_CLONE_VERSIONS" 
     When I send the "post" request with Assignment LEID and clone Type to "DomainURL/ENDPOINT_LEC_CLONE_VERSIONS" using request body as "CloneExperienceAssignmentVersion" with "application/json" using <type> 
      | description      | key                           | value                                   | 
      | key to be update | patches[1].op                 | replace                                 | 
      | key to be update | patches[1].value.data.message | This is the Replaced Assignment Message | 
     Then Server should return "201" Status for LE 
      And Verify the response which is found in clone learning experience "<AssetClass>" with patch 
      | key        | value      | 
      | AssetClass | ASSIGNMENT | 
      And Validate "<Patch>" in "LEC" in couchbase "cluster1" with 
      | key     | value                                   | 
      | message | This is the Replaced Assignment Message | 
      | type    | ASSIGNMENT                              | 
  
    Examples: 
      | type    | Patch                | AssetClass | 
      | SHALLOW | Update Message Patch | ASSIGNMENT | 
  
  @Story:GLP-62674 @ALM_442014 @Story:GLP-60857 @Negative @Regression 
  Scenario Outline:GLP-FSR-SAeT_ENG_EC_CloneLearningExperience_Assignment_Version_WithType_DEEP_TC005 
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST" 
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json" 
      | description    | key                        | value            | 
      | Random value   | extensions.sectionId       | Dynamic          | 
      | key from excel | extends.sources[0]._id     | productId        | 
      | key from excel | extends.sources[0]._bssVer | bssver           | 
      | key from excel | learningModel._id          | LearningModelid  | 
      | key from excel | learningModel._ver         | LearningModelver | 
      | key from excel | extends.sources[0]._ver    | productVersion   | 
  
  #When send the request with "<LEID>" 
     When I send the "post" request "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperienceAssignment" with "application/json" 
      | description                    | key                     | value                           | 
      | key from excel                 | learningModel._id       | Assignment_LearningModelid      | 
      | key from excel                 | learningModel._ver      | Assignment_LearningModelver     | 
      | key from excel                 | learningModel._bssVer   | Assignment_LearningModelVersion | 
      | Id from create Course          | scope.assets[0]._id     | dynamic                         | 
      | version from create Course     | scope.assets[0]._ver    | dynamic                         | 
      | bss version from create Course | scope.assets[0]._bssVer | dynamic                         | 
  
     Then Server should return "201" Status for LE 
  
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_CLONE_VERSIONS" 
     When I send the "post" request with Assignment LEID and clone Type to "DomainURL/ENDPOINT_LEC_CLONE_VERSIONS" using request body as "CloneExperienceAssignmentVersion" with "application/json" using <type> 
      | description | key | value | 
     Then Server should return "400" Status for LE 
  
    Examples: 
      | type | 
      | DEEP | 
  
  @Story:GLP-62674 @Story:GLP-64948 @Story:GLP-60857 @ALM_442216
  @Positive @Regression 
  Scenario Outline:GLP-FSR-SAeT_ENG_EC_CloneLearningExperience_Non-Native Assignment_Version_Add_Assignment_Message_Patch_TC006 
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST" 
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json" 
      | description    | key                        | value            | 
      | Random value   | extensions.sectionId       | Dynamic          | 
      | key from excel | extends.sources[0]._id     | productId        | 
      | key from excel | extends.sources[0]._bssVer | bssver           | 
      | key from excel | learningModel._id          | LearningModelid  | 
      | key from excel | learningModel._ver         | LearningModelver | 
      | key from excel | extends.sources[0]._ver    | productVersion   | 
  
  #When send the request with "<LEID>" 
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "Non-NativeAssignment" with "application/json" 
      | description                    | key                     | value                                      | 
      | key from excel                 | learningModel._id       | Non-Native_Assignment_LearningModelid      | 
      | key from excel                 | learningModel._ver      | Non-Native_Assignment_LearningModelver     | 
      | key from excel                 | learningModel._bssVer   | Non-Native_Assignment_LearningModelVersion | 
      | Id from create Course          | scope.assets[0]._id     | dynamic                                    | 
      | version from create Course     | scope.assets[0]._ver    | dynamic                                    | 
      | bss version from create Course | scope.assets[0]._bssVer | dynamic                                    | 
     Then Server should return "201" Status for LE 
  
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_CLONE_VERSIONS" 
     When I send the "post" request with Non Native Assignment LEID and clone Type to "DomainURL/ENDPOINT_LEC_CLONE_VERSIONS" using request body as "CloneExperienceAssignmentVersion" with "application/json" using <type> 
      | description      | key                           | value                                                     | 
      | key to be update | patches[1].op                 | replace                                                   | 
      | key to be update | patches[1].path               | /resources/STDNT-MSG-51b84752-1614-4ddd-ad7a-f488f165b662 | 
      | key to be update | patches[1].value.data.message | This is the Added Message for Non-Native Assignment       | 
     Then Server should return "201" Status for LE 
      And Verify the response which is found in clone learning experience "<AssetClass>" with patch 
      | key        | value               | 
      | AssetClass | NONNATIVEASSIGNMENT | 
      And Validate Non-Native Assignment "<Patch>" in "LEC" in couchbase "cluster1" with 
      | key     | value                                               | 
      | message | This is the Added Message for Non-Native Assignment | 
      | type    | NONNATIVEASSIGNMENT                                 | 
  
    Examples: 
      | type    | Patch     | AssetClass          | 
      | SHALLOW | Add Patch | NONNATIVEASSIGNMENT | 
  
  @Story:GLP-62674 @Story:GLP-64948 @Story:GLP-60857 @ALM_442217
  @Positive @Regression 
  Scenario Outline:GLP-FSR-SAeT_ENG_EC_CloneLearningExperience_Non-Native_Assignment_Remove_Assignment_Message_Patch_TC007 
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST" 
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json" 
      | description    | key                        | value            | 
      | Random value   | extensions.sectionId       | Dynamic          | 
      | key from excel | extends.sources[0]._id     | productId        | 
      | key from excel | extends.sources[0]._bssVer | bssver           | 
      | key from excel | learningModel._id          | LearningModelid  | 
      | key from excel | learningModel._ver         | LearningModelver | 
      | key from excel | extends.sources[0]._ver    | productVersion   | 
  
  #When send the request with "<LEID>" 
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "Non-NativeAssignment" with "application/json" 
      | description                    | key                     | value                                      | 
      | key from excel                 | learningModel._id       | Non-Native_Assignment_LearningModelid      | 
      | key from excel                 | learningModel._ver      | Non-Native_Assignment_LearningModelver     | 
      | key from excel                 | learningModel._bssVer   | Non-Native_Assignment_LearningModelVersion | 
      | Id from create Course          | scope.assets[0]._id     | dynamic                                    | 
      | version from create Course     | scope.assets[0]._ver    | dynamic                                    | 
      | bss version from create Course | scope.assets[0]._bssVer | dynamic                                    | 
     Then Server should return "201" Status for LE 
  
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_CLONE_VERSIONS" 
     When I send the "post" request with Non Native Assignment LEID and clone Type to "DomainURL/ENDPOINT_LEC_CLONE_VERSIONS" using request body as "CloneExperienceAssignmentVersion" with "application/json" using <type> 
      | description      | key             | value                                                                  | 
      | key to be update | patches[1].op   | remove                                                                 | 
      | key to be update | patches[1].path | /resources/STDNT-MSG-51b84752-1614-4ddd-ad7a-f488f165b662/data/message | 
     Then Server should return "201" Status for LE 
      And Verify the response which is found in clone learning experience "<AssetClass>" with patch 
      | key        | value               | 
      | AssetClass | NONNATIVEASSIGNMENT | 
      And Validate Non-Native Assignment "<Patch>" in "LEC" in couchbase "cluster1" with 
      | key  | value               | 
      | type | NONNATIVEASSIGNMENT | 
  
    Examples: 
      | type    | Patch        | AssetClass          | 
      | SHALLOW | Remove Patch | NONNATIVEASSIGNMENT | 
  
  @Story:GLP-62674 @Story:GLP-64948 @Story:GLP-60857 @ALM_442219
  @Positive @Regression 
  Scenario Outline:GLP-FSR-SAeT_ENG_EC_CloneLearningExperience_Non-Native Assignment_Version_Update_Assignment_Title_Patch_TC009 
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST" 
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json" 
      | description    | key                        | value            | 
      | Random value   | extensions.sectionId       | Dynamic          | 
      | key from excel | extends.sources[0]._id     | productId        | 
      | key from excel | extends.sources[0]._bssVer | bssver           | 
      | key from excel | learningModel._id          | LearningModelid  | 
      | key from excel | learningModel._ver         | LearningModelver | 
      | key from excel | extends.sources[0]._ver    | productVersion   | 
  
  #When send the request with "<LEID>" 
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "Non-NativeAssignment" with "application/json" 
      | description                    | key                     | value                                      | 
      | key from excel                 | learningModel._id       | Non-Native_Assignment_LearningModelid      | 
      | key from excel                 | learningModel._ver      | Non-Native_Assignment_LearningModelver     | 
      | key from excel                 | learningModel._bssVer   | Non-Native_Assignment_LearningModelVersion | 
      | Id from create Course          | scope.assets[0]._id     | dynamic                                    | 
      | version from create Course     | scope.assets[0]._ver    | dynamic                                    | 
      | bss version from create Course | scope.assets[0]._bssVer | dynamic                                    | 
     Then Server should return "201" Status for LE 
  
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_CLONE_VERSIONS" 
     When I send the "post" request with Non Native Assignment LEID and clone Type to "DomainURL/ENDPOINT_LEC_CLONE_VERSIONS" using request body as "CloneExperienceAssignmentVersion" with "application/json" using <type> 
      | description      | key                   | value                                                     | 
      | key to be update | patches[0].op         | replace                                                   | 
      | key to be update | patches[0].path       | /resources/ASSIGNMENTTITLE                                | 
      | key to be update | patches[0].value.data | This is the Replaced Assignment Title                     | 
      | key to be update | patches[1].path       | /resources/STDNT-MSG-51b84752-1614-4ddd-ad7a-f488f165b662 | 
     Then Server should return "201" Status for LE 
      And Verify the response which is found in clone learning experience "<AssetClass>" with patch 
      | key        | value               | 
      | AssetClass | NONNATIVEASSIGNMENT | 
      And Validate Non-Native Assignment "<Patch>" in "LEC" in couchbase "cluster1" with 
      | key     | value                                 | 
      | message | This is the Replaced Assignment Title | 
      | type    | NONNATIVEASSIGNMENT                   | 
  
    Examples: 
      | type    | Patch              | AssetClass          | 
      | SHALLOW | Update Title Patch | NONNATIVEASSIGNMENT | 
  
  @Story:GLP-62674 @Story:GLP-64948 @Story:GLP-60857 @ALM_442218
  @Positive @Regression 
  Scenario Outline:GLP-FSR-SAeT_ENG_EC_CloneLearningExperience_Non-Native_Assignment_Version_Update_Assignment_Message_Patch_TC008 
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST" 
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json" 
      | description    | key                        | value            | 
      | Random value   | extensions.sectionId       | Dynamic          | 
      | key from excel | extends.sources[0]._id     | productId        | 
      | key from excel | extends.sources[0]._bssVer | bssver           | 
      | key from excel | learningModel._id          | LearningModelid  | 
      | key from excel | learningModel._ver         | LearningModelver | 
      | key from excel | extends.sources[0]._ver    | productVersion   | 
  
  #When send the request with "<LEID>" 
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "Non-NativeAssignment" with "application/json" 
      | description                    | key                     | value                                      | 
      | key from excel                 | learningModel._id       | Non-Native_Assignment_LearningModelid      | 
      | key from excel                 | learningModel._ver      | Non-Native_Assignment_LearningModelver     | 
      | key from excel                 | learningModel._bssVer   | Non-Native_Assignment_LearningModelVersion | 
      | Id from create Course          | scope.assets[0]._id     | dynamic                                    | 
      | version from create Course     | scope.assets[0]._ver    | dynamic                                    | 
      | bss version from create Course | scope.assets[0]._bssVer | dynamic                                    | 
     Then Server should return "201" Status for LE 
  
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_CLONE_VERSIONS" 
     When I send the "post" request with Non Native Assignment LEID and clone Type to "DomainURL/ENDPOINT_LEC_CLONE_VERSIONS" using request body as "CloneExperienceAssignmentVersion" with "application/json" using <type> 
      | description      | key                           | value                                                     | 
      | key to be update | patches[1].op                 | replace                                                   | 
      | key to be update | patches[1].path               | /resources/STDNT-MSG-51b84752-1614-4ddd-ad7a-f488f165b662 | 
      | key to be update | patches[1].value.data.message | This is the Replaced Assignment Message                   | 
     Then Server should return "201" Status for LE 
      And Verify the response which is found in clone learning experience "<AssetClass>" with patch 
      | key        | value               | 
      | AssetClass | NONNATIVEASSIGNMENT | 
      And Validate Non-Native Assignment "<Patch>" in "LEC" in couchbase "cluster1" with 
      | key     | value                                   | 
      | message | This is the Replaced Assignment Message | 
      | type    | NONNATIVEASSIGNMENT                     | 
  
    Examples: 
      | type    | Patch                | AssetClass          | 
      | SHALLOW | Update Message Patch | NONNATIVEASSIGNMENT | 
  
  @Story:GLP-62674 @Story:GLP-64948 @Story:GLP-60857
  @ALM_442220 @Positive @Regression 
  Scenario Outline:GLP-FSR-SAeT_ENG_EC_CloneLearningExperience_Non-Native Assignment_Version_Update_AssignmentTemplate_Patch_TC010 
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST" 
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json" 
      | description    | key                        | value            | 
      | Random value   | extensions.sectionId       | Dynamic          | 
      | key from excel | extends.sources[0]._id     | productId        | 
      | key from excel | extends.sources[0]._bssVer | bssver           | 
      | key from excel | learningModel._id          | LearningModelid  | 
      | key from excel | learningModel._ver         | LearningModelver | 
      | key from excel | extends.sources[0]._ver    | productVersion   | 
  
  #When send the request with "<LEID>" 
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "Non-NativeAssignment" with "application/json" 
      | description                    | key                     | value                                      | 
      | key from excel                 | learningModel._id       | Non-Native_Assignment_LearningModelid      | 
      | key from excel                 | learningModel._ver      | Non-Native_Assignment_LearningModelver     | 
      | key from excel                 | learningModel._bssVer   | Non-Native_Assignment_LearningModelVersion | 
      | Id from create Course          | scope.assets[0]._id     | dynamic                                    | 
      | version from create Course     | scope.assets[0]._ver    | dynamic                                    | 
      | bss version from create Course | scope.assets[0]._bssVer | dynamic                                    | 
     Then Server should return "201" Status for LE 
  
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_CLONE_VERSIONS" 
     When I send the "post" request with Non Native Assignment LEID and clone Type to "DomainURL/ENDPOINT_LEC_CLONE_VERSIONS" using request body as "CloneExperienceAssignmentVersion" with "application/json" using <type> 
      | description      | key                           | value                          | 
      | key to be update | patches[1].op                 | replace                        | 
      | key to be update | patches[1].path               | /resources/ASSIGNMENTEMPLATE   | 
      | key to be update | patches[1].value.category     | NARRATIVE                      | 
      | key to be update | patches[1].value.model        | assignment-template            | 
      | key to be update | patches[1].value.data.message | This is the updated message id | 
     Then Server should return "201" Status for LE 
      And Verify the response which is found in clone learning experience "<AssetClass>" with patch 
      | key        | value               | 
      | AssetClass | NONNATIVEASSIGNMENT | 
      And Validate Non-Native Assignment "<Patch>" in "LEC" in couchbase "cluster1" with 
      | key     | value                          | 
      | message | This is the updated message id | 
      | type    | NONNATIVEASSIGNMENT            | 
  
    Examples: 
      | type    | Patch                     | AssetClass          | 
      | SHALLOW | Assignment Template Patch | NONNATIVEASSIGNMENT | 
  
  @Story:GLP-62674  @Story:GLP-60857 @ALM_442453 @Negative
  @Regression 
  Scenario Outline:GLP-FSR-SAeT_ENG_EC_CloneLearningExperience_Assignment_Version_Update_Assignment_Title_Patch_WithInvalid_OP_TC011 
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST" 
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json" 
      | description    | key                        | value            | 
      | Random value   | extensions.sectionId       | Dynamic          | 
      | key from excel | extends.sources[0]._id     | productId        | 
      | key from excel | extends.sources[0]._bssVer | bssver           | 
      | key from excel | learningModel._id          | LearningModelid  | 
      | key from excel | learningModel._ver         | LearningModelver | 
      | key from excel | extends.sources[0]._ver    | productVersion   | 
  
     When I send the "post" request "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperienceAssignment" with "application/json" 
      | description                    | key                     | value                           | 
      | key from excel                 | learningModel._id       | Assignment_LearningModelid      | 
      | key from excel                 | learningModel._ver      | Assignment_LearningModelver     | 
      | key from excel                 | learningModel._bssVer   | Assignment_LearningModelVersion | 
      | Id from create Course          | scope.assets[0]._id     | dynamic                         | 
      | version from create Course     | scope.assets[0]._ver    | dynamic                         | 
      | bss version from create Course | scope.assets[0]._bssVer | dynamic                         | 
  
     Then Server should return "201" Status for LE 
  
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_CLONE_VERSIONS" 
     When I send the "post" request with Assignment LEID and clone Type to "DomainURL/ENDPOINT_LEC_CLONE_VERSIONS" using request body as "CloneExperienceAssignmentVersion" with "application/json" using <type> 
      | description      | key                   | value                                 | 
      | key to be update | patches[0].op         | replac                                | 
      | key to be update | patches[1].op         | remov                                 | 
      | key to be update | patches[0].path       | /resources/ASSIGNMENTTITLE            | 
      | key to be update | patches[0].value.data | This is the Replaced Assignment Title | 
     Then Server should return "400" Status for LE 
  
    Examples: 
      | type    | 
      | SHALLOW | 
  
  @Story:GLP-60857 @ALM_446410 @Positive
  @Regression 
  Scenario Outline:GLP-FSR-SAeT_ENG_EC_CloneLearningExperience_Assignment_Version_Add_Assignment_Message_Patch__with_query_param_returnEmbedded=true_TC0012 
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST" 
     When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json" 
      | description    | key                        | value            | 
      | Random value   | extensions.sectionId       | Dynamic          | 
      | key from excel | extends.sources[0]._id     | productId        | 
      | key from excel | extends.sources[0]._bssVer | bssver           | 
      | key from excel | learningModel._id          | LearningModelid  | 
      | key from excel | learningModel._ver         | LearningModelver | 
      | key from excel | extends.sources[0]._ver    | productVersion   | 
  
     When I send the "post" request "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperienceAssignment" with "application/json" 
      | description                    | key                     | value                           | 
      | key from excel                 | learningModel._id       | Assignment_LearningModelid      | 
      | key from excel                 | learningModel._ver      | Assignment_LearningModelver     | 
      | key from excel                 | learningModel._bssVer   | Assignment_LearningModelVersion | 
      | Id from create Course          | scope.assets[0]._id     | dynamic                         | 
      | version from create Course     | scope.assets[0]._ver    | dynamic                         | 
      | bss version from create Course | scope.assets[0]._bssVer | dynamic                         | 
      | key to be remove               | resources.STDNT-MSG-51b84752-1614-4ddd-ad7a-f488f165b663  |                                 | 
      | key to be remove               | resourcePlan[1]                                           |                                 | 
     Then Server should return "201" Status for LE 
  
    Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_CLONE_VERSIONS" 
     When I send the "post" request with Assignment LEID and clone Type to "DomainURL/ENDPOINT_LEC_CLONE_VERSIONS" using request body as "addCloneExperienceAssignmentVersion" with "application/json" using <type> 
      | description      | key                           | value                     | 
      | key to be update | patches[1].op                 | add                       | 
      | key to be update | patches[1].value.data.message | This is the Added Message | 
     Then Server should return "201" Status for LE 
      And Check all course information is coming in response when query param returnEmbedded=true send with the clone version call
      And Verify the response which is found in clone learning experience "<AssetClass>" with patch 
      | key        | value      | 
      | AssetClass | ASSIGNMENT | 
      And Validate "<Patch>" in "LEC" in couchbase "cluster1" with 
      | key     | value                     | 
      | message | This is the Added Message | 
      | type    | ASSIGNMENT                | 
  
    Examples: 
      | type    | Patch     | AssetClass | 
      | SHALLOW | Add Patch | ASSIGNMENT | 
  
  
