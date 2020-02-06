package com.pearson.glp.qe.stepdefinations.lec;

import static com.pearson.glp.qe.utility.ResponseUtils.response;
import static io.restassured.config.EncoderConfig.encoderConfig;

import java.util.HashMap;

import org.testng.Assert;

import com.pearson.glp.qe.base.SerenityBase;
import com.pearson.glp.qe.builders.CommonSteps;
import com.pearson.glp.qe.endpoints.APIEndPoints;
import com.pearson.glp.qe.utility.ResponseUtils;
import com.pearson.glp.qe.utility.Utility;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import io.restassured.RestAssured;
import net.serenitybdd.rest.SerenityRest;
import net.thucydides.core.annotations.Steps;

public class GetLearningStatusById extends SerenityBase {

    @Steps
    CommonSteps common;
    String endPoint;
    UpdateLearningExperienceStausById learning_Id;

    HashMap<String, String> pathParam = new HashMap<>();
    HashMap<String, Object> headers = new HashMap<>();

    @Given("^set the endpoint for GET Fetching the Learning Experience State$")
    public void
           set_the_endpoint_for_get_fetching_the_learning_experience_state()
                   throws Throwable {

        endPoint = common.createEndPoint(configurationsXlsMap.get("DomainURL"),
                APIEndPoints.ENDPOINT_LEC_GET_Learning_Exp_Status);

    }

    @SuppressWarnings("static-access")
    @When("^send the request with \"([^\"]*)\" for Fetching the Learning Experience State with \"([^\"]*)\"$")
    public void
           send_the_request_with_something_for_fetching_the_learning_experience_state_with_something(
                   String LEID, String Method) throws Throwable {

        if (LEID.equals("System")) {

            pathParam.put("LEID", CreateLearningExperience.leId);

        } else
            pathParam.put("LEID", LEID); // Passing Path parameter using Hashmap

        if (Method.equals("GET")) {
            response = Utility.getCallWithPathParam(pathParam, endPoint,
                    "JSON"); // Calling function written
            // already
        }

        else {
            response = SerenityRest.given()
                    .config(RestAssured.config().encoderConfig(encoderConfig()
                            .appendDefaultContentCharsetToContentTypeIfUndefined(
                                    false)))
                    .relaxedHTTPSValidation().headers(headers)
                    .contentType("application/json").pathParams(pathParam)
                    .body("").log().all().when().post(endPoint);
        }
    }

    @Then("^Schema should validated for GET Fetching the Learning Experience State$")
    public void
           schema_should_validated_for_get_fetching_the_learning_experience_state()
                   throws Throwable {

        ResponseUtils.validateJsonSchema("GLP-48962-res");

    }

    @And("^verify the \"([^\"]*)\" code for Fetching the Learning Experience State$")
    public void
           verify_the_something_code_for_fetching_the_learning_experience_state(
                   int Status) throws Throwable {
        ResponseUtils.assertReponseStatus(Status);
    }

    @And("^Verify the \"([^\"]*)\" in response$")
    public void verify_the_something_in_response(String errorMessage)
            throws Throwable {

        String errmsg = ResponseUtils
                .getDataFromResponseUsingJsonPath("errorDesc");

        Assert.assertEquals(errmsg, errorMessage);

    }

    @And("^Server should return valid sla time for Fetching the Learning Experience State$")
    public void
           server_should_return_valid_sla_time_for_fetching_the_learning_experience_state()
                   throws Throwable {

        ResponseUtils.assertReponseTime(
                Long.parseLong(configurationsXlsMap.get("slaTime")));
    }

}
