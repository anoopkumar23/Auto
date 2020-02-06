@GLOB-33 
Feature: Create Learning Experience of SAet type 
@ALM_429282 @Positive @Smoke @Story:GLP-55795 @Couchbase @Regression 
Scenario Outline:
GLP-FSR-SAeT_ENG_AD_ Create _Learning_Experience_of_SAet_type_Positive_TC001 
	Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST" 
	When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json" 
		| description    | key                        | value                | 
		| Random value   | extensions.sectionId       | Dynamic              | 
		| key from excel | extends.sources[0]._id     | productId            | 
		| key from excel | extends.sources[0]._bssVer | bssver               | 
		| key from excel | learningModel._id          | LearningModelid      | 
		| key from excel | learningModel._ver         | LearningModelver     | 
		| key from excel | extends.sources[0]._ver    | productVersion       | 
		| key to be add  | configuration              | policyGroups-[REVEL] | 
		| key to be add  | extensions                 | productModel-SAET    | 
		
	Then Server should return "201" Status for LE 
	Then I have the CouchBase response of query from "cluster1" 
	And I should see following in the Couchbase response from "lec" as 
		| Description            | key                                             | value                     | 
		| label                  | label                                           | <label>                   | 
		| extension.productModel | extensions.additionalProperties.productModel                         | <extensions.productModel> | 
	Examples: 
		| label | extensions.productModel | 
		| REVEL | SAET                    | 
		
		
		@ALM_429283 @Negative @Story:GLP-55795 @Regression 
		Scenario:
		GLP-FSR-SAeT_ENG_AD_ Create _Learning_Experience_of_SAet_type_Negative_TC002 
			Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST" 
			When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json" 
				| description    | key                        | value                | 
				| Random value   | extensions.sectionId       | Dynamic              | 
				| key from excel | extends.sources[0]._id     | productId            | 
				| key from excel | extends.sources[0]._bssVer | bssver               | 
				| key from excel | learningModel._id          | LearningModelid      | 
				| key from excel | learningModel._ver         | LearningModelver     | 
				| key from excel | extends.sources[0]._ver    | productVersion       | 
				| key to be add  | configuration              | policyGroups-[REVEL] | 
				| key to be add  | extensions                 | productModel-[REVEL] | 
			Then Server should return "400" Status for LE 
			
		@ALM_429283 @Negative @Story:GLP-55795 @Regression 
		Scenario:
		GLP-FSR-SAeT_ENG_AD_ Create _Learning_Experience_of_SAet_type_Negative_TC002 
			Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST" 
			When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json" 
				| description    | key                        | value                | 
				| Random value   | extensions.sectionId       | Dynamic              | 
				| key from excel | extends.sources[0]._id     | productId            | 
				| key from excel | extends.sources[0]._bssVer | bssver               | 
				| key from excel | learningModel._id          | LearningModelid      | 
				| key from excel | learningModel._ver         | LearningModelver     | 
				| key from excel | extends.sources[0]._ver    | productVersion       | 
				| key to be add  | configuration              | policyGroups-[REVEL] | 
				| key to be add  | extensions                 | productModel-[REVEL] | 
			Then Server should return "400" Status for LE 
			
			
		@Negative @ALM_420397 @Story:GLP-55795 @Regression 
		Scenario: To Post Learning Experience for Invalid enum 
			Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST" 
			When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json" 
				| description      | key                         | value            | 
				| Random value     | extensions.sectionId        | Dynamic          | 
				| key from excel   | extends.sources[0]._id      | productId        | 
				| key from excel   | extends.sources[0]._bssVer  | bssver           | 
				| key from excel   | learningModel._id           | LearningModelid  | 
				| key from excel   | learningModel._ver          | LearningModelver | 
				| key from excel   | extends.sources[0]._ver     | productVersion   | 
				|key to be update|resources.COURSETITLE._resourceType|CONTENT|
			Then Server should return "400" Status for LE 
			
			
			
		@Negative @ALM_421507 @Story:GLP-55795 @Regression 
		Scenario: To Post Learning Experience for Invalid date 
			Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST" 
			When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json" 
				| description      | key                        | value                     | 
				| Random value     | extensions.sectionId       | Dynamic                   | 
				| key from excel   | extends.sources[0]._id     | productId                 | 
				| key from excel   | extends.sources[0]._bssVer | bssver                    | 
				| key from excel   | learningModel._id          | LearningModelid           | 
				| key from excel   | learningModel._ver         | LearningModelver          | 
				| key from excel   | extends.sources[0]._ver    | productVersion            | 
				| key to be update | expiresOn                  | 2018-05-18T19:16:15+00:0  | 
				
			Then Server should return "400" Status for LE 
			
		@ALM_417587 @ALM_419870 @Positive @Smoke @ALM_417587 @ALM_424518 @ALM_424516
		@ALM_401588 @Story:GLP-55795 @Couchbase @Regression 
		Scenario Outline:
		To Post Learning Experience for postive data with sending all mandotry field 
			Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST" 
			When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json" 
				| description    | key                        | value                | 
				| Random value   | extensions.sectionId       | Dynamic              | 
				| key from excel | extends.sources[0]._id     | productId            | 
				| key from excel | extends.sources[0]._bssVer | bssver               | 
				| key from excel | learningModel._id          | LearningModelid      | 
				| key from excel | learningModel._ver         | LearningModelver     | 
				| key from excel | extends.sources[0]._ver    | productVersion       | 
				| key to be add  | configuration              | policyGroups-[REVEL] | 
				
			Then Server should return "201" Status for LE 
			
			Then I have the CouchBase response of query from "cluster1" 
			
			And I should see following in the Couchbase response from "lec" as 
				| Description            | key                                             | value    | 
				| label                  | label                                           | <label>  | 
				|_status                 |_status                                          |<_status> |
			Examples: 
				| label | _status       |
				| REVEL | PRE_COMPOSED  | 
				
				@ALM_419879 @ALM_419871 @Positive @Smoke @Story:GLP-55795 @Regression 
				Scenario:
				To Post Learning Experience for postive data with sending with non-mandatory fields blank 
				
					Given I have the learning experience endpoint as "DomainURL/ENDPOINT_LEC_POST" 
					When I send the "post" request to "DomainURL/ENDPOINT_LEC_POST" using request body as "CreateLearningExperiencenew" with "application/json" 
						| description      | key                        | value            | 
						| Random value     | extensions.sectionId       | Dynamic          | 
						| key from excel   | extends.sources[0]._id     | productId        | 
						| key from excel   | extends.sources[0]._bssVer | bssver           | 
						| key from excel   | learningModel._id          | LearningModelid  | 
						| key from excel   | learningModel._ver         | LearningModelver | 
						| key from excel   | extends.sources[0]._ver    | productVersion   | 
						| key to be update | label                      |                  | 
						
					Then Server should return "201" Status for LE 
    