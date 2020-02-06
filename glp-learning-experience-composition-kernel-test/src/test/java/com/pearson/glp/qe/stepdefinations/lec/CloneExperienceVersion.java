package com.pearson.glp.qe.stepdefinations.lec;

import static com.pearson.glp.qe.utility.PropertyHolder.getProperty;
import static com.pearson.glp.qe.utility.ResponseUtils.response;
import static io.restassured.config.EncoderConfig.encoderConfig;

import java.util.HashMap;

import org.testng.Assert;

import com.pearson.glp.qe.base.SerenityBase;
import com.pearson.glp.qe.builders.CommonSteps;
import com.pearson.glp.qe.endpoints.JsonPath;
import com.pearson.glp.qe.utility.ResponseUtils;
import com.pearson.glp.qe.utility.SerenityServices;
import com.pearson.glp.qe.utility.Utility;

import cucumber.api.DataTable;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import io.restassured.RestAssured;
import io.restassured.specification.RequestSpecification;
import net.serenitybdd.rest.SerenityRest;
import net.thucydides.core.annotations.Steps;

public class CloneExperienceVersion extends SerenityBase {
    @Steps
    CommonSteps common;
    static String endPoint;
    String getLearningVer, getLearningId, requestReadJson, clonedVer, clonedId,
            clonedBssVer;
    RequestSpecification request;

    HashMap<String, String> queryP = new HashMap<>();
    HashMap<String, String> pathP = new HashMap<>();

    @When("^I send \"([^\"]*)\" request with LEID and \"([^\"]*)\" to \"([^\"]*)\" using request body as \"([^\"]*)\" with \"([^\"]*)\" using Shallow$")
    public void
           i_send_something_request_with_leid_and_something_to_something_using_request_body_as_something_with_something_using_shallow(
                   String method, String sectionId, String endPoint,
                   String readJson, String Contenttype, DataTable table)
                   throws Throwable {

        requestReadJson = Utility.readJson("CloneLearningExperienceVersion");

        if (sectionId.equals("Valid")) {
            requestReadJson = requestReadJson.replace("SectionId",
                    GetLearningExperienceCollection.sectionIdValue);
            pathP.put("LEID", CreateLearningExperience.leId);
            queryP.put("type", "SHALLOW");
            response = SerenityServices.doRequest(SerenityRest.given()
                    .config(RestAssured.config().encoderConfig(encoderConfig()
                            .appendDefaultContentCharsetToContentTypeIfUndefined(
                                    false)))
                    .relaxedHTTPSValidation().contentType(Contenttype)
                    .pathParams(pathP).queryParams(queryP)
                    .body(requestReadJson), method, (getProperty("url")));

            clonedVer = ResponseUtils.getDataFromResponseUsingJsonPath(
                    JsonPath.JSON_PATH_VER_POST_lE);
            clonedId = ResponseUtils.getDataFromResponseUsingJsonPath(
                    JsonPath.JSON_PATH_ID_POST_lE);
            clonedBssVer = ResponseUtils.getDataFromResponseUsingJsonPath(
                    JsonPath.JSON_PATH_BVER_POST_lE);
        }

        else if (sectionId.equals("blank")) {
            requestReadJson = requestReadJson.replace("SectionId", "");

            pathP.put("LEID", CreateLearningExperience.leId);

            queryP.put("type", "SHALLOW");
            response = SerenityServices.doRequest(SerenityRest.given()
                    .config(RestAssured.config().encoderConfig(encoderConfig()
                            .appendDefaultContentCharsetToContentTypeIfUndefined(
                                    false)))
                    .relaxedHTTPSValidation().contentType(Contenttype)
                    .pathParams(pathP).queryParams(queryP)
                    .body(requestReadJson), method, (getProperty("url")));
        } else if (sectionId.equals("invalid")) {

            pathP.put("LEID", CreateLearningExperience.leId);

            queryP.put("type", "SHALLOW");
            response = SerenityServices.doRequest(SerenityRest.given()
                    .config(RestAssured.config().encoderConfig(encoderConfig()
                            .appendDefaultContentCharsetToContentTypeIfUndefined(
                                    false)))
                    .relaxedHTTPSValidation().contentType(Contenttype)
                    .pathParams(pathP).queryParams(queryP)
                    .body(requestReadJson), method, (getProperty("url")));
        }

        else if (sectionId.equals("dontsend")) {
            pathP.put("LEID", CreateLearningExperience.leId);

            queryP.put("type", "SHALLOW");
            response = SerenityServices.doRequest(SerenityRest.given()
                    .config(RestAssured.config().encoderConfig(encoderConfig()
                            .appendDefaultContentCharsetToContentTypeIfUndefined(
                                    false)))
                    .relaxedHTTPSValidation().contentType(Contenttype)
                    .pathParams(pathP).queryParams(queryP)
                    .body(Utility.updateRequestBody(table, readJson)), method,
                    getProperty("url"));
        }

    }

    @And("^Verify the response which is found in clone learning experience version$")
    public void
           verify_the_response_which_is_found_in_clone_learning_experience_version()
                   throws Throwable {

        Assert.assertNotEquals(clonedVer, CreateLearningExperience.leVer);

        Assert.assertEquals(clonedId, CreateLearningExperience.leId);

        Assert.assertEquals(clonedBssVer, CreateLearningExperience.le_bssVer);

    }

    @Then("^Schema should validate for Clone Learning Experience Version$")
    public void schema_should_validate_for_clone_learning_experience_version() {

        ResponseUtils.validateJsonSchema(
                "GLP-57288_CloneLearningExperienceVersion_Schema");
    }

    @When("^I send \"([^\"]*)\" request with LEID and sectionId with \"([^\"]*)\" to \"([^\"]*)\" using request body as \"([^\"]*)\" with \"([^\"]*)\" using Shallow$")
    public void
           i_send_something_request_with_leid_and_sectionid_with_something_to_something_using_request_body_as_something_with_something_using_shallow(
                   String method, String Category, String endPoint,
                   String readJson, String Contenttype) throws Throwable {

        requestReadJson = Utility.readJson("CloneLearningExperienceVersion");

        if (Category.equals("blank")) {

            requestReadJson = requestReadJson.replace("SectionId",
                    GetLearningExperienceCollection.sectionIdValue);
            requestReadJson = requestReadJson.replace("NARRATIVE", "");

            pathP.put("LEID", CreateLearningExperience.leId);

            queryP.put("type", "SHALLOW");
            response = SerenityServices.doRequest(SerenityRest.given()
                    .config(RestAssured.config().encoderConfig(encoderConfig()
                            .appendDefaultContentCharsetToContentTypeIfUndefined(
                                    false)))
                    .relaxedHTTPSValidation().contentType(Contenttype)
                    .pathParams(pathP).queryParams(queryP)
                    .body(requestReadJson), method, (getProperty("url")));
        } else if (Category.equals("invalid")) {
            requestReadJson = requestReadJson.replace("SectionId",
                    GetLearningExperienceCollection.sectionIdValue);
            requestReadJson = requestReadJson.replace("NARRATIVE", "QA");
            pathP.put("LEID", CreateLearningExperience.leId);

            queryP.put("type", "SHALLOW");
            response = SerenityServices.doRequest(SerenityRest.given()
                    .config(RestAssured.config().encoderConfig(encoderConfig()
                            .appendDefaultContentCharsetToContentTypeIfUndefined(
                                    false)))
                    .relaxedHTTPSValidation().contentType(Contenttype)
                    .pathParams(pathP).queryParams(queryP)
                    .body(requestReadJson), method, (getProperty("url")));
        }

    }

    @When("^I send \"([^\"]*)\" request with LEID and \"([^\"]*)\" to \"([^\"]*)\" using request body as \"([^\"]*)\" with \"([^\"]*)\" using Deep$")
    public void
           i_send_something_request_with_leid_and_something_to_something_using_request_body_as_something_with_something_using_deep(
                   String method, String sectionId, String endPoint,
                   String readJson, String Contenttype) throws Throwable {

        requestReadJson = Utility.readJson("CloneLearningExperienceVersion");
        if (sectionId.equals("Valid")) {
            requestReadJson = requestReadJson.replace("SectionId",
                    GetLearningExperienceCollection.sectionIdValue);
            pathP.put("LEID", CreateLearningExperience.leId);

            queryP.put("type", "DEEP");
            response = SerenityServices.doRequest(SerenityRest.given()
                    .config(RestAssured.config().encoderConfig(encoderConfig()
                            .appendDefaultContentCharsetToContentTypeIfUndefined(
                                    false)))
                    .relaxedHTTPSValidation().contentType(Contenttype)
                    .pathParams(pathP).queryParams(queryP)
                    .body(requestReadJson), method, (getProperty("url")));
        }

    }

    @When("^I send \"([^\"]*)\" request with \"([^\"]*)\" and \"([^\"]*)\" to \"([^\"]*)\" using request body as \"([^\"]*)\" with \"([^\"]*)\" using Deep$")
    public void
           i_send_something_request_with_something_and_something_to_something_using_request_body_as_something_with_something_using_deep(
                   String method, String LEID, String sectionId,
                   String endPoint, String readJson, String Contenttype)
                   throws Throwable {

        requestReadJson = Utility.readJson("CloneLearningExperienceVersion");

        if (sectionId.equals("Valid")) {
            requestReadJson = requestReadJson.replace("SectionId",
                    GetLearningExperienceCollection.sectionIdValue);

            pathP.put("LEID", CreateLearningExperience.leId);
            queryP.put("type", "SHALLOW");
            response = SerenityServices.doRequest(SerenityRest.given()
                    .config(RestAssured.config().encoderConfig(encoderConfig()
                            .appendDefaultContentCharsetToContentTypeIfUndefined(
                                    false)))
                    .relaxedHTTPSValidation().contentType(Contenttype)
                    .pathParams(pathP).queryParams(queryP)
                    .body(requestReadJson), method, (getProperty("url")));

            if (sectionId.equals("Valid")) {
                requestReadJson = requestReadJson.replace("SectionId",
                        GetLearningExperienceCollection.sectionIdValue);

                if (LEID.equals("Invalid"))

                    pathP.put("LEID", "83a484d5-80de-418b-894c-f46f9f878999");
                queryP.put("type", "SHALLOW");
                response = SerenityServices.doRequest(SerenityRest.given()
                        .config(RestAssured.config()
                                .encoderConfig(encoderConfig()
                                        .appendDefaultContentCharsetToContentTypeIfUndefined(
                                                false)))
                        .relaxedHTTPSValidation().contentType(Contenttype)
                        .pathParams(pathP).queryParams(queryP)
                        .body(requestReadJson), method, (getProperty("url")));

            }

        }
    }
}