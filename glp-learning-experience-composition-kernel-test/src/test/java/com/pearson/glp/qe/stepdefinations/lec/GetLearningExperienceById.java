package com.pearson.glp.qe.stepdefinations.lec;

import static com.pearson.glp.qe.utility.PropertyHolder.getProperty;
import static com.pearson.glp.qe.utility.ResponseUtils.response;

import java.util.HashMap;
import java.util.Map;

import org.testng.Assert;

import com.pearson.common.framework.api.core.SerenityRESTService;
import com.pearson.glp.qe.base.SerenityBase;
import com.pearson.glp.qe.builders.CommonSteps;
import com.pearson.glp.qe.endpoints.APIEndPoints;
import com.pearson.glp.qe.utility.ResponseUtils;
import com.pearson.glp.qe.utility.Utility;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import io.restassured.response.ResponseBody;
import net.thucydides.core.annotations.Steps;

public class GetLearningExperienceById extends SerenityBase {

    @Steps
    CommonSteps common;
    UpdateLearningExperienceStausById learning_Id;

    String endPoint, endpointt, assetClassValue;
    Map<String, String> headers = new HashMap<String, String>();

    public static String getLearningId, getLearningVer;

    @Given("^set the endpoint for GET LE contract$")
    public void set_the_endpoint_for_get_le_contract() throws Throwable {

        // Getting url from excel file and Endpoint from common class
        // APIEndPoints

        endPoint = common.createEndPoint(configurationsXlsMap.get("DomainURL"),
                APIEndPoints.ENDPOINT_LEC_GET);

    }

    @SuppressWarnings("static-access")
    @When("^send the request with \"([^\"]*)\"$")
    public void send_the_request_with_something(String LEID) throws Throwable {
        HashMap<String, String> pathp = new HashMap<>();
        if (LEID.equals("System")) {
            pathp.put("LEID", CreateLearningExperience.leId);
        } else
            pathp.put("LEID", LEID); // Passing Path parameter using Hashmap

        response = Utility.getCallWithPathParam(pathp, endPoint, "JSON"); // Calling
                                                                          // function
                                                                          // written
        // already

        getLearningId = ResponseUtils.getDataFromResponseUsingJsonPath("_id");
        getLearningVer = ResponseUtils
                .getDataFromResponseUsingJsonPath("_bssVer");

    }

    @Then("^Schema should validated for GET LE contract$")
    public void schema_should_validated_for_get_le_contract() {

        ResponseUtils.validateJsonSchema("GLP_45990_GET_LE_Contract_Response"); // calling
        // ResposeUtils
        // class
        // function

    }

    @And("^verify the \"([^\"]*)\" code for get LE$")

    public void verify_the_something_code_for_get_LE(int Status)
            throws Throwable

    {
        ResponseUtils.assertReponseStatus(Status); // calling ResposeUtils class
        // function
    }

    @And("^Verify the \"([^\"]*)\" message in response$")
    public void verify_the_something_message_in_response(String errorMessage)
            throws Throwable {

        String err = ResponseUtils
                .getDataFromResponseUsingJsonPath("errorDesc");

        Assert.assertEquals(err, errorMessage);

    }

    @And("^Server should return valid sla time for GET LE$")

    public void Server_should_return_valid_sla_time_for_GET_LE() {

        ResponseUtils.assertReponseTime(
                Long.parseLong(configurationsXlsMap.get("slaTime")));

    }

    @Given("^set the endpoint for GET LEC$")
    public void set_the_endpoint_for_get_lec() throws Throwable {

        // Getting url from excel file and Endpoint from common class
        // APIEndPoints

        endPoint = common.createEndPoint(configurationsXlsMap.get("DomainURL"),
                APIEndPoints.ENDPOINT_LEC_GET_Learning_Exp);

    }

    @Given("^set the endpoint for GET LEC function$")
    public void set_the_endpoint_for_get_lec_Function() throws Throwable {

        // Getting url from excel file and Endpoint from common class
        // APIEndPoints

        endPoint = common.createEndPoint(configurationsXlsMap.get("DomainURL"),
                APIEndPoints.ENDPOINT_LEC_GET_Learning_Exp_Fxn);
    }

    @When("^send the requests with \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\"$")
    public void send_the_requests_withsomethingandsomethingandsomething(
            String bssver, String fields, String LEID) {

        // HashMap<String, String> params = new HashMap<String, String>();

        if (LEID.equals("System")) {
            LEID = CreateLearningExperience.leId;
        }
        HashMap<String, String> pathp = new HashMap<>();

        pathp.put("_bssVer", bssver);
        pathp.put("fields", fields);

        endpointt = endPoint.replaceAll("\\{LEID\\}", LEID);
        response = SerenityRESTService.getCallWithHeaderAndQueryParam(headers,
                pathp, endpointt, "JSON");
    }

    @When("^send the requests with \"([^\"]*)\" and \"([^\"]*)\"$")
    public void send_the_requests_withbsssveronly(String bssver, String LEID) {

        // HashMap<String, String> params = new HashMap<String, String>();

        if (LEID.equals("System")) {
            LEID = CreateLearningExperience.leId;
        }
        HashMap<String, String> pathp = new HashMap<>();
        pathp.put("_bssVer", bssver);
        endpointt = endPoint.replaceAll("\\{LEID\\}", LEID);
        response = SerenityRESTService.getCallWithHeaderAndQueryParam(headers,
                pathp, endpointt, "JSON");
    }

    @And("^Verify that json response contains the columns passed in fields filter$")
    public void
           verify_that_json_response_contains_the_columns_passed_in_fields_filter()
                   throws Throwable {
        @SuppressWarnings("rawtypes")
        ResponseBody body = response.getBody();
        String bodyAsString = body.asString();
        Assert.assertEquals(bodyAsString.contains("configuration"), true);
        Assert.assertNotNull("configuration");
        Assert.assertEquals(bodyAsString.contains("constraints"), true);
        Assert.assertNotNull("constraints");
        Assert.assertEquals(bodyAsString.contains("scope"), true);
        Assert.assertNotNull("scope");
        Assert.assertEquals(bodyAsString.contains("learningModel"), true);
        Assert.assertNotNull("learningModel");
        Assert.assertEquals(bodyAsString.contains("resources"), true);
        Assert.assertNotNull("resources");
        Assert.assertEquals(bodyAsString.contains("extensions"), true);
        Assert.assertNotNull("extensions");
        Assert.assertEquals(bodyAsString.contains("resourcePlan"), true);
        Assert.assertNotNull("resourcePlan");
    }

    @And("^Verify that json response contains the columns passed in fields filter contract$")
    public void
           verify_that_json_response_contains_the_columns_passed_in_fields_filter_contract()
                   throws Throwable {
        @SuppressWarnings("rawtypes")
        ResponseBody body = response.getBody();
        String bodyAsString = body.asString();
        Assert.assertEquals(bodyAsString.contains("configuration"), true);
        Assert.assertNotNull("configuration");
    }

    /************** stub GLP-55502 **************/

    @When("^send the requests with \"([^\"]*)\" and \"([^\"]*)\" \"([^\"]*)\"$")
    public void send_the_requests_with_something_and_something_something(
            String LEID, String fields, String configuration) throws Throwable {

        HashMap<String, String> pathp = new HashMap<>();

        pathp.put("fields", configuration);

        endpointt = getProperty("url").replaceAll("\\{LEID\\}", LEID);
        response = SerenityRESTService.getCallWithHeaderAndQueryParam(headers,
                pathp, endpointt, "JSON");

    }

    @And("^Verify that configurations details are coming in the json response$")
    public void
           verify_that_configurations_details_are_coming_in_the_json_response()
                   throws Throwable {

        @SuppressWarnings("rawtypes")
        ResponseBody body = response.getBody();
        String bodyAsString = body.asString();
        Assert.assertEquals(bodyAsString.contains("configuration"), true);
        Assert.assertNotNull("configuration");
        Assert.assertEquals(bodyAsString.contains("policyGroups"), true);
        Assert.assertNotNull("policyGroups");

    }

    @When("^send the requests with \"([^\"]*)\"$")
    public void send_the_requests_with_something(String LEID) throws Throwable {

        HashMap<String, String> pathp = new HashMap<>();

        pathp.put("LEID", LEID);

        response = SerenityRESTService.getCallWithPathParam(pathp,
                getProperty("url"), "JSON");
    }

    @And("^Verify that assetClass is \"([^\"]*)\" details are coming in the json response$")
    public void
           verify_that_assetclass_is_something_details_are_coming_in_the_json_response(
                   String ASSIGNMENT) throws Throwable {

        assetClassValue = ResponseUtils
                .getDataFromResponseUsingJsonPath("assetClass");

        Assert.assertEquals(ASSIGNMENT, assetClassValue);
    }

}
