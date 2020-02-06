package com.pearson.glp.qe.stepdefinations.lec;

import static com.pearson.glp.qe.utility.PropertyHolder.getProperty;
import static com.pearson.glp.qe.utility.ResponseUtils.response;
import static io.restassured.config.EncoderConfig.encoderConfig;

import java.util.HashMap;
import java.util.Map;

import org.testng.Assert;

import com.pearson.glp.qe.base.SerenityBase;
import com.pearson.glp.qe.builders.CommonSteps;
import com.pearson.glp.qe.endpoints.APIEndPoints;
import com.pearson.glp.qe.utility.ResponseUtils;
import com.pearson.glp.qe.utility.SerenityServices;
import com.pearson.glp.qe.utility.Utility;

import cucumber.api.DataTable;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import io.restassured.RestAssured;
import net.serenitybdd.rest.SerenityRest;
import net.thucydides.core.annotations.Steps;

public class UpdateLearningExperienceStausById extends SerenityBase {

    @Steps
    CommonSteps common;
    // GLP_45015_Create_LE createLe;
    String endPoint, jsonString;

    Map<String, Object> pathP = new HashMap<>();

    @Given("^set the endpoint for POST Publish Learning Experience$")
    public void set_the_endpoint_for_POST_Publish_Learning_Experience()
            throws Throwable {
        endPoint = common.createEndPoint(configurationsXlsMap.get("DomainURL"),
                APIEndPoints.ENDPOINT_LEC_Publish_Learning_Exp);

    }

    @When("^User send the request to POST Publish Learning Experience with \"([^\"]*)\"$")
    public void
           user_send_the_request_to_post_publish_learning_experience_with_something(
                   String LEID, DataTable dt) throws Throwable {

        Map<String, Object> pathP = new HashMap<>();
        /*
         * Empty hashmap as authorization not implimented Creating hashmap so
         * that json values can be inserted from feature file
         */
        Map<String, String> alter = new HashMap<>();
        Map<String, String> headers = new HashMap<>();
        for (int i = 0; i < dt.raw().get(0).size(); i++) {
            alter.put(dt.raw().get(0).get(i), dt.raw().get(1).get(i));
        }

        if (LEID.equals("System"))
            pathP.put("LEID", CreateLearningExperience.leId);
        else
            pathP.put("LEID", LEID);

        jsonString = Utility.alterJson("47206_POST.txt", alter); // Alter Json
        response = SerenityRest.given()
                .config(RestAssured.config().encoderConfig(encoderConfig()
                        .appendDefaultContentCharsetToContentTypeIfUndefined(
                                false)))
                .relaxedHTTPSValidation().headers(headers)
                .contentType("application/json").pathParams(pathP)
                .body(jsonString).log().all().when().post(endPoint);
        response.prettyPrint();

    }

    @Then("^Schema should validate for Publish Learning Experience$")
    public void schema_should_validate_for_publish_learning_experience()
            throws Throwable {
        ResponseUtils.validateJsonSchema("47206_res");
    }

    @Then("^verify the (.+) code$")
    public void verify_the_code(int status) throws Throwable {
        ResponseUtils.assertReponseStatus(status);
    }

    @Then("^Verify that \"([^\"]*)\" is as expected in response$")
    public void verify_that_something_is_as_expected_in_response(
            String errorMessage) throws Throwable {
        String errmsg = ResponseUtils
                .getDataFromResponseUsingJsonPath("errorDesc");

        Assert.assertEquals(errmsg, errorMessage);
    }

    @Then("^Server should return valid sla time for Publish Learning Experience$")
    public void ServershouldreturnvalidslatimeforPublishLearningExperience() {
        ResponseUtils.assertReponseTime(
                Long.parseLong(configurationsXlsMap.get("slaTime")));
    }

    @When("^I send the \"([^\"]*)\" request to \"([^\"]*)\" using request body as \"([^\"]*)\" with \"([^\"]*)\" and \"([^\"]*)\"$")
    public void
           i_send_the_something_request_to_something_using_request_body_as_something_with_something_and_something(
                   String method, String endpoint, String jsonBody,
                   String Contenttype, String pathParam, DataTable table)
                   throws Throwable {

        Map<String, Object> pathP = new HashMap<>();
        if (pathParam.equals("leid")) {
            pathP.put("LEID", CreateLearningExperience.leId);
        }
        response = SerenityServices.doRequest(SerenityRest.given()
                .config(RestAssured.config().encoderConfig(encoderConfig()
                        .appendDefaultContentCharsetToContentTypeIfUndefined(
                                false)))
                .relaxedHTTPSValidation().contentType(Contenttype)
                .pathParams(pathP)
                .body(Utility.updateRequestBody(table, jsonBody)), method,
                (getProperty("url")));

        response.prettyPrint();
    }

    @When("^I send the \"([^\"]*)\" request to \"([^\"]*)\" using request body as \"([^\"]*)\" with \"([^\"]*)\" and \"([^\"]*)\" with queryparam$")
    public void
           i_send_the_something_request_to_something_using_request_body_as_something_with_something_and_something_with_queryparam(
                   String method, String endpoint, String jsonBody,
                   String Contenttype, String pathParam, DataTable table)
                   throws Throwable {

        if (pathParam.equals("sectionid"))
            pathP.put("extensions.sectionId",
                    GetLearningExperienceCollection.sectionIdValue);
        pathP.put("collectionDetails", "_created");
        response = SerenityServices.doRequest(SerenityRest.given()
                .config(RestAssured.config().encoderConfig(encoderConfig()
                        .appendDefaultContentCharsetToContentTypeIfUndefined(
                                false)))
                .relaxedHTTPSValidation().contentType(Contenttype)
                .queryParams(pathP)
                .body(Utility.updateRequestBody(table, jsonBody)), method,
                (getProperty("url")));

        response.prettyPrint();
    }

    @When("^I send the \"([^\"]*)\" transition_state_request to \"([^\"]*)\" using request body as \"([^\"]*)\" with \"([^\"]*)\"$")
    public void
           i_send_the_something_transition_state_request_to_something_using_request_body_as_something_with_something(
                   String method, String endpoint, String jsonBody,
                   String Contenttype, DataTable table) throws Throwable {

        pathP.put("LEID", CreateLearningExperience.leId);

        response = SerenityServices.doRequest(SerenityRest.given()
                .config(RestAssured.config().encoderConfig(encoderConfig()
                        .appendDefaultContentCharsetToContentTypeIfUndefined(
                                false)))
                .relaxedHTTPSValidation().contentType(Contenttype)
                .pathParams(pathP)
                .body(Utility.updateRequestBody(table, jsonBody)), method,
                (getProperty("url")));

        response.prettyPrint();

    }

}