package com.pearson.glp.qe.stepdefinations.lec;

import static com.pearson.glp.qe.utility.ResponseUtils.response;
import static io.restassured.config.EncoderConfig.encoderConfig;

import java.util.HashMap;
import java.util.Map;

import org.testng.Assert;

import com.pearson.glp.qe.base.SerenityBase;
import com.pearson.glp.qe.builders.CommonSteps;
import com.pearson.glp.qe.endpoints.APIEndPoints;
import com.pearson.glp.qe.utility.ResponseUtils;
import com.pearson.glp.qe.utility.Utility;

import cucumber.api.DataTable;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import io.restassured.RestAssured;
import net.serenitybdd.rest.SerenityRest;
import net.thucydides.core.annotations.Steps;

public class UpdateLearningExperienceVersions extends SerenityBase {

    @Steps
    CommonSteps common;
    UpdateLearningExperienceStausById learning_Id;
    String endPoint, jsonString, learningExperienceId;
    String countPrevious;
    static String version;

    @Given("^set the endpoint for Update LE$")
    public void set_the_endpoint_for_Update_LE() throws Throwable {
        // EndPoint and url are saved in data excel file
        endPoint = common.createEndPoint(configurationsXlsMap.get("DomainURL"),
                APIEndPoints.ENDPOINT_LEC_Update_Learning_Exp);

    }

    @SuppressWarnings("static-access")
    @When("^User send the request to update LE with \"([^\"]*)\"$")
    public void User_send_the_request_to_update_LE_with_something(String LEID,
            DataTable dt) throws Throwable {

        Map<String, String> pathP = new HashMap<>();
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

        jsonString = Utility.alterJson("UpdateVersion.txt", alter); // json is
                                                                    // alter
        // by this method

        response = SerenityRest.given()
                .config(RestAssured.config().encoderConfig(encoderConfig()
                        .appendDefaultContentCharsetToContentTypeIfUndefined(
                                false)))
                .relaxedHTTPSValidation().headers(headers)
                .contentType("application/json").pathParams(pathP)
                .body(jsonString).log().all().when().post(endPoint);

        response.prettyPrint();

    }

    @Then("^Schema should validate for Update LE$")
    public void schema_should_validate_for_Update_LE() throws Throwable {

        ResponseUtils.validateJsonSchema("45267_res");

    }

    @Then("^Verify that \"([^\"]*)\" is valid in response$")
    public void verify_that_something_is_valid_in_response(String errorMessage)
            throws Throwable {
        String errmsg = ResponseUtils
                .getDataFromResponseUsingJsonPath("errorDesc");

        Assert.assertEquals(errmsg, errorMessage);
    }

    @SuppressWarnings("static-access")
    @And("^the Update LE data should be available in \"([^\"]*)\" in couchbase \"([^\"]*)\"$")

    public void theUpdateLEdatashouldbeavailableinLECincouchbasecluster2(
            String microService, String cluster1) throws Throwable {
        String query = "select * from lec where META().id = 'LE::VER::"
                + CreateLearningExperience.leVer + "'";

        response = Utility.getDbData(cluster1, query);
        Assert.assertEquals(ResponseUtils
                .getDataFromResponseUsingJsonPath("status").toString(),
                "success");

    }

    @Then("^Server should return \"([^\"]*)\" status for LE version$")
    public void Server_should_return_something_status_for_LE_version(int Status)
            throws Throwable {
        ResponseUtils.assertReponseStatus(Status);
    }

}
