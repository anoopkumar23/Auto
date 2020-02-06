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

public class CloneLearningExperience extends SerenityBase {
    @Steps
    CommonSteps common;
    static String endPoint;
    public static String leId, leVer, le_bssVer, getLearningVer, getLearningId,
            sourceExperienceId, sourceExperienceBssVer, sourceExperienceVer,
            sourceExperienceAssetClass, clonedExperienceAssetClass,
            childrenSourceExperienceAssetClass,
            childrenClonedExperienceAssetClass;
    RequestSpecification request;

    HashMap<String, String> queryP = new HashMap<>();
    HashMap<String, String> pathP = new HashMap<>();

    @When("^I send the \"([^\"]*)\" request \"([^\"]*)\" using request body as \"([^\"]*)\" with \"([^\"]*)\"$")
    public void
           i_send_the_something_request_something_using_request_body_as_something_with_something(
                   String method, String endpoint, String jsonBody,
                   String Contenttype, DataTable table) throws Throwable {

        response = SerenityServices.doRequest(SerenityRest.given()
                .config(RestAssured.config().encoderConfig(encoderConfig()
                        .appendDefaultContentCharsetToContentTypeIfUndefined(
                                false)))
                .relaxedHTTPSValidation().contentType(Contenttype)
                .body(Utility.updateRequestBody(table, jsonBody)), method,
                (getProperty("url")));

        response.prettyPrint();

        leId = ResponseUtils.getDataFromResponseUsingJsonPath(
                JsonPath.JSON_PATH_ID_POST_lE);
        leVer = ResponseUtils.getDataFromResponseUsingJsonPath(
                JsonPath.JSON_PATH_VER_POST_lE);
        le_bssVer = ResponseUtils.getDataFromResponseUsingJsonPath(
                JsonPath.JSON_PATH_BVER_POST_lE);

    }

    @When("^I send the \"([^\"]*)\" request with LEID and clone Type to \"([^\"]*)\" using request body as \"([^\"]*)\" with \"([^\"]*)\" using (.+)$")
    public void
           i_send_the_something_request_with_leid_and_clone_type_to_something_using_request_body_as_something_with_something_using(
                   String method, String endPoint, String jsonBody,
                   String Contenttype, String type, DataTable table)
                   throws Throwable {

        pathP.put("LEID", CreateLearningExperience.leId);

        queryP.put("type", type);

        response = SerenityServices.doRequest(SerenityRest.given()
                .config(RestAssured.config().encoderConfig(encoderConfig()
                        .appendDefaultContentCharsetToContentTypeIfUndefined(
                                false)))
                .relaxedHTTPSValidation().contentType(Contenttype)
                .pathParams(pathP).queryParams(queryP)
                .body(Utility.updateRequestBody(table, jsonBody)), method,
                (getProperty("url")));
    }

    @And("^Verify the response which is found in clone learning experience course using \"([^\"]*)\"$")
    public void
           Verify_the_response_which_is_found_in_clone_learning_experience_course_using_something(
                   String type, DataTable table) throws Throwable {

        sourceExperienceId = ResponseUtils.getDataFromResponseUsingJsonPath(
                JsonPath.JSON_PATH_SOURCE_EXPERIENCE_ID);

        Assert.assertEquals(sourceExperienceId, CreateLearningExperience.leId);

        sourceExperienceVer = ResponseUtils.getDataFromResponseUsingJsonPath(
                JsonPath.JSON_PATH_SOURCE_EXPERIENCE_VER);

        Assert.assertEquals(sourceExperienceVer,
                CreateLearningExperience.leVer);

        sourceExperienceBssVer = ResponseUtils.getDataFromResponseUsingJsonPath(
                JsonPath.JSON_PATH_SOURCE_EXPERIENCE_BSSVER);

        Assert.assertEquals(sourceExperienceBssVer,
                CreateLearningExperience.le_bssVer);

        sourceExperienceAssetClass = ResponseUtils
                .getDataFromResponseUsingJsonPath(
                        JsonPath.JSON_PATH_SOURCE_EXPERIENCE_ASSETCLASS);

        Assert.assertEquals(sourceExperienceAssetClass,
                table.raw().get(1).get(1));

        clonedExperienceAssetClass = ResponseUtils
                .getDataFromResponseUsingJsonPath(
                        JsonPath.JSON_PATH_CLONED_EXPERIENCE_ASSETCLASS);

        Assert.assertEquals(clonedExperienceAssetClass,
                table.raw().get(1).get(1));

        if (type.equals("DEEP")) {

            childrenSourceExperienceAssetClass = ResponseUtils
                    .getDataFromResponseUsingJsonPath(
                            JsonPath.JSON_PATH_CHILDREN_SOURCE_EXPERIENCE_ASSETCLASS);

            Assert.assertEquals(childrenSourceExperienceAssetClass,
                    table.raw().get(2).get(1));

            childrenClonedExperienceAssetClass = ResponseUtils
                    .getDataFromResponseUsingJsonPath(
                            JsonPath.JSON_PATH_CHILDREN_CLONED_EXPERIENCE_ASSETCLASS);

            Assert.assertEquals(childrenClonedExperienceAssetClass,
                    table.raw().get(2).get(1));

        }
    }

    @And("^Verify the response which is found in clone learning experience assignment$")
    public void
           verify_the_response_which_is_found_in_clone_learning_experience_assignment(
                   DataTable table) throws Throwable {

        sourceExperienceId = ResponseUtils.getDataFromResponseUsingJsonPath(
                JsonPath.JSON_PATH_SOURCE_EXPERIENCE_ID);

        Assert.assertEquals(sourceExperienceId, CreateLearningExperience.leId);

        sourceExperienceVer = ResponseUtils.getDataFromResponseUsingJsonPath(
                JsonPath.JSON_PATH_SOURCE_EXPERIENCE_VER);

        Assert.assertEquals(sourceExperienceVer,
                CreateLearningExperience.leVer);

        sourceExperienceBssVer = ResponseUtils.getDataFromResponseUsingJsonPath(
                JsonPath.JSON_PATH_SOURCE_EXPERIENCE_BSSVER);

        Assert.assertEquals(sourceExperienceBssVer,
                CreateLearningExperience.le_bssVer);

        sourceExperienceAssetClass = ResponseUtils
                .getDataFromResponseUsingJsonPath(
                        JsonPath.JSON_PATH_SOURCE_EXPERIENCE_ASSETCLASS);

        Assert.assertEquals(sourceExperienceAssetClass,
                table.raw().get(1).get(1));

        clonedExperienceAssetClass = ResponseUtils
                .getDataFromResponseUsingJsonPath(
                        JsonPath.JSON_PATH_CLONED_EXPERIENCE_ASSETCLASS);

        Assert.assertEquals(clonedExperienceAssetClass,
                table.raw().get(1).get(1));

    }

    @Then("^Schema should validate for Clone Learning Exp$")
    public void schema_should_validate_for_Clone_Learning_Exp() {

        ResponseUtils.validateJsonSchema("GLP-57286_CloneLearningExp_Schema");
    }
}