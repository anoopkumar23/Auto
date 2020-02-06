#@GLOB-7
#@Story:GLP-51562 @obsolete
Feature: As a Tester I want to Validate the Get Learning Experience Collection
##@ALM_408649
##@ALM_408653
##@ALM_417281
##@ALM_413020
##@ALM_413017
##@Positive
##@Smoke
##Scenario Outline: To Get Learning Experience Collection with pagination with positive values
##	Given Set the endpoint for GET LE Collection
##	When Send the request with "<limit>" and "<offset>"
##	And Verify the "<Status code>" code for LE collection
##	And Validate LE status coming as COMPOSED or PUBLISHED and "<size>"
##Examples: 
##  |Description               |offset        |limit | Status code| size |
##  | Limit greater than zero  | 0            | 50   |  200       | 50   |
##  | Positive offset value    | 10           | 5    |  200       | 5    |
##  | Zero offset              | 0            | 10   |  200       | 10   |                  
##@ALM_413019
##@Negative
##Scenario Outline: To Get Learning Experience Collection with pagination with negative values
##	Given Set the endpoint for GET LE Collection
##	When Send the request with "<limit>" and "<offset>"
##	And Verify the "<Status code>" code for LE collection
##	
##Examples: 
##      | Description                       | offset   | limit | Status code | 
##      | Negative offset value             | -2       | 9     | 400         | 
##      | Negative limit value              | 0        | -1    | 400         |     
##      | Limit greater than hundred        | 0        | 110   | 400         |       
##      | Offset in decimal                 | 10.0     | 50    | 400         |       
##      | Limit in decimal                  | 0        | 10.0  | 400         |       
##      | Offset greater than total records | 900000000| 5     | 200         |       
##      | Limit equal to zero               | 5        | 0     | 400         |       
##      | Blank limit                       | 0        |       | 400         |      
##      | Blank offset                      |          | 8     | 400         |       
##@ALM_413019       
##@Negative
##Scenario Outline: To Get Learning Experience Collection with pagination with negative values of keys
##	Given Set the endpoint for GET LE Collection
##	When Send the request with "<LIMIT>" and "<OFFSET>" keys in uppercase
##	And Verify the "<Status code>" code for LE collection
##Examples: 
##      | Description                       | OFFSET   | LIMIT | Status code | 
##      | Keys in Uppercase                 |  2       | 5     | 400         |        
##@ALM_417282
##Scenario Outline: To GET Learning Experience Collection using sectionId & verify next Link, previous link and self link persent in response & verify the count
##   Given set the endpoint for POST LE 
##    When User send the request to POST LE
##    Given Getting Learning Experience ID
##   And the Get LE data should be available in "LEC" in couchbase "cluster1"
##  Given Set the endpoint for GET LE Collection
##    When User send the request to GET LE collection with "<sectionId>" "<LIMIT>" "<OFFSET>"
##    And Verify the Next Link present in response with "<sectionId>" "<LIMIT>" "<OFFSET>"
##   And Verify the Previous Link present in response with "<sectionId>" "<LIMIT>" "<OFFSET>"
##    And Verify the Self Link present in response with "<sectionId>" "<LIMIT>" "<OFFSET>"
##    Then Verify the total number of count in response available in "LEC" in couchbase "cluster1"
##   Examples:
## |Description               |OFFSET        |LIMIT | Status code|sectionId|
## | Limit greater than zero  | 5            | 8    |  200       |System   |
## | Positive offset value    | 10           | 5    |  200       |System   |  
##@Negative
#  #@ALM_417283
#  #Scenario Outline: To GET Learning Experience Collection using valid sectionId where previous link should not present
#  #  Given Set the endpoint for GET LE Collection
#  #  When User send the request to GET LE collection with "<sectionId>" "<LIMIT>" "<OFFSET>"  
#  #  And Verify the Previous Link not present in response with "<sectionId>" "<LIMIT>" "<OFFSET>" 
#  #  Examples:
#  #|Description   |OFFSET        |LIMIT | Status code|sectionId|
#  #|Offset zero   | 0            | 50   |  200       |System   |
#  #@Negative
#  #@ALM_417283
#  #Scenario Outline: To GET Learning Experience Collection using valid sectionId where next link should not present
#  # Given Set the endpoint for GET LE Collection
#  # When User send the request to GET LE collection with "<sectionId>" "<LIMIT>" "<OFFSET>"
#  # Then Verify the total number of count in response available in "LEC" in couchbase "cluster1"
#  # And Verify the Next Link not present in response with "<sectionId>" "<LIMIT>" "<OFFSET>" 
#  #   Examples:
#  # |Description   |OFFSET    |LIMIT | Status code|sectionId|
#  # |Offset zero   | 10       | 5   |  200        |System   |
Scenario: This feature is obsolete
Given is obsolete
When obsolete
Then obsolete
