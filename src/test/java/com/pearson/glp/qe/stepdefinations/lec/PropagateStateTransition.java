package com.pearson.glp.qe.stepdefinations.lec;

import static com.pearson.glp.qe.utility.PropertyHolder.getProperty;
import static com.pearson.glp.qe.utility.ResponseUtils.response;
import static io.restassured.config.EncoderConfig.encoderConfig;
import static org.assertj.core.api.Assertions.assertThat;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.testng.Assert;

import com.pearson.glp.qe.base.SerenityBase;
import com.pearson.glp.qe.builders.CommonSteps;
import com.pearson.glp.qe.pojos.GetLearningExperience;
import com.pearson.glp.qe.utility.ResponseUtils;
import com.pearson.glp.qe.utility.SerenityServices;
import com.pearson.glp.qe.utility.Utility;

import cucumber.api.DataTable;
import cucumber.api.java.en.And;
import cucumber.api.java.en.When;
import io.restassured.RestAssured;
import net.serenitybdd.rest.SerenityRest;
import net.thucydides.core.annotations.Steps;


public class PropagateStateTransition extends SerenityBase {
	
	@Steps
    CommonSteps common;
    static String pathParam, Status, table;
    public static String getAssignmentId, getAssignmentVer;
	
	
	 @When("^I send the \"([^\"]*)\" transition_state_request with propagate is true to \"([^\"]*)\" using request body as \"([^\"]*)\" with \"([^\"]*)\"$")
	    public void i_send_the_something_transitionstaterequest_with_propagate_is_true_to_something_using_request_body_as_something_with_something(
                   String method, String endpoint, String jsonBody,
                   String Contenttype, DataTable table)
                   throws Throwable {

        Map<String, Object> pathP = new HashMap<>();
   pathP.put("LEID", CreateLearningExperience.leId);
    
        
        Map<String, Object> queryP = new HashMap<>();
        queryP.put("propagate","true");
        response = SerenityServices.doRequest(SerenityRest.given()
                .config(RestAssured.config().encoderConfig(encoderConfig()
                        .appendDefaultContentCharsetToContentTypeIfUndefined(
                                false)))
                .relaxedHTTPSValidation().contentType(Contenttype)
                .pathParams(pathP).queryParams(queryP)
                .body(Utility.updateRequestBody(table, jsonBody)), method,
                (getProperty("url")));

        response.prettyPrint();
        Status=ResponseUtils
                .getDataFromResponseUsingJsonPath("transitionState");
        
        List<List<String>> myTable= table.raw();
    	System.out.println("the status is::" +myTable.get(2).get(2));
    	Assert.assertEquals(Status,myTable.get(2).get(2));
        
    }
	 
	 @And("^Validate the Assignment status coming as PRE_COMPOSED/COMPOSED/PUBLISHED$")
	    public void validate_the_assignment_status_coming_as_precomposedcompoedpublished() throws Throwable {
	        try {
	            GetLearningExperience objgetlearningexperience = response.then()
	                    .extract().as(GetLearningExperience.class);
	            assertThat(objgetlearningexperience.learningExperiences)
	                    .extracting(
	                            learningExperiences -> learningExperiences._status)
	                    .containsAnyOf("COMPOSED", "PUBLISHED", "PRE_COMPOSED");

	            assertThat(objgetlearningexperience.learningExperiences).extracting(
	                    learningExperiences -> learningExperiences._status);

	            getAssignmentId = ResponseUtils.getDataFromResponseUsingJsonPath(
	                    "learningExperiences[0]._id");
	            getAssignmentVer = ResponseUtils.getDataFromResponseUsingJsonPath(
	                    "learningExperiences[0]._ver");

	        } catch (Exception e) {
	            Assert.fail("Fields of response are not matching " + e);
	        }
	 
	 }
	 @When("^I send the \"([^\"]*)\" transition_state_request again with propagate is true to \"([^\"]*)\" using request body as \"([^\"]*)\" with \"([^\"]*)\"$")
	    public void i_send_the_something_transitionstaterequest_again_with_propagate_is_true_to_something_using_request_body_as_something_with_something(
                String method, String endpoint, String jsonBody,
                String Contenttype, DataTable table)
                throws Throwable {

     Map<String, Object> pathP = new HashMap<>();
pathP.put("LEID", CreateLearningExperience.leId);
 
     
     Map<String, Object> queryP = new HashMap<>();
     queryP.put("propagate","true");
     response = SerenityServices.doRequest(SerenityRest.given()
             .config(RestAssured.config().encoderConfig(encoderConfig()
                     .appendDefaultContentCharsetToContentTypeIfUndefined(
                             false)))
             .relaxedHTTPSValidation().contentType(Contenttype)
             .pathParams(pathP).queryParams(queryP)
             .body(Utility.updateRequestBody(table, jsonBody)), method,
             (getProperty("url")));

     response.prettyPrint();
     
	 }
}