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
import cucumber.api.java.en.When;
import io.restassured.RestAssured;
import net.serenitybdd.rest.SerenityRest;
import net.thucydides.core.annotations.Steps;

public class CloneExperienceAssignmentVersion extends SerenityBase {

    @Steps
    CommonSteps common;
    String clonedId, clonedVer, clonedBssVer, addPatch, removePatch,
            updateAssignmentTitle, nonNativeAddPatch, nonNativeAssignmentType,
            nonNativeRemovePatch, assignmentTemplate;

    HashMap<String, String> queryP = new HashMap<>();
    HashMap<String, String> pathP = new HashMap<>();

    @When("^I send the \"([^\"]*)\" request with Assignment LEID and clone Type to \"([^\"]*)\" using request body as \"([^\"]*)\" with \"([^\"]*)\" using (.+)$")
    public void
           i_send_the_something_request_with_assignment_leid_and_clone_type_to_something_using_request_body_as_something_with_something_using(
                   String method, String endPoint, String jsonBody,
                   String Contenttype, String type, DataTable table)
                   throws Throwable {

        pathP.put("LEID", CloneLearningExperience.leId);

        queryP.put("type", type);
        queryP.put("returnEmbedded", "true");

        response = SerenityServices.doRequest(SerenityRest.given()
                .config(RestAssured.config().encoderConfig(encoderConfig()
                        .appendDefaultContentCharsetToContentTypeIfUndefined(
                                false)))
                .relaxedHTTPSValidation().contentType(Contenttype)
                .pathParams(pathP).queryParams(queryP)
                .body(Utility.updateRequestBody(table, jsonBody)), method,
                (getProperty("url")));

        clonedVer = ResponseUtils.getDataFromResponseUsingJsonPath(
                JsonPath.JSON_PATH_VER_POST_lE);
        clonedId = ResponseUtils.getDataFromResponseUsingJsonPath(
                JsonPath.JSON_PATH_ID_POST_lE);
        clonedBssVer = ResponseUtils.getDataFromResponseUsingJsonPath(
                JsonPath.JSON_PATH_BVER_POST_lE);

    }

    @When("^I send the \"([^\"]*)\" request with Non Native Assignment LEID and clone Type to \"([^\"]*)\" using request body as \"([^\"]*)\" with \"([^\"]*)\" using (.+)$")
    public void
           i_send_the_something_request_with_non_native_assignment_leid_and_clone_type_to_something_using_request_body_as_something_with_something_using(
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

        clonedVer = ResponseUtils.getDataFromResponseUsingJsonPath(
                JsonPath.JSON_PATH_VER_POST_lE);
        clonedId = ResponseUtils.getDataFromResponseUsingJsonPath(
                JsonPath.JSON_PATH_ID_POST_lE);
        clonedBssVer = ResponseUtils.getDataFromResponseUsingJsonPath(
                JsonPath.JSON_PATH_BVER_POST_lE);

    }

    @And("^Validate \"([^\"]*)\" in \"([^\"]*)\" in couchbase \"([^\"]*)\" with$")
    public void validate_something_in_something_in_couchbase_something_with(
            String Patch, String microService, String cluster1, DataTable table)
            throws Throwable {

        if (Patch.equals("Add Patch")) {
            String query = SerenityBase.queries.getProperty("Patch_Validation")
                    .replace("ClonedVer", clonedVer);

            response = Utility.getDbData(cluster1, query);

            addPatch = ResponseUtils.getDataFromResponseUsingJsonPath(
                    JsonPath.JSON_PATH_ADD_PATCH);

            Assert.assertEquals(addPatch, table.raw().get(1).get(1));

            nonNativeAssignmentType = ResponseUtils
                    .getDataFromResponseUsingJsonPath(
                            JsonPath.JSON_PATH_NON_NATIVE_ASSIGNMENTTYPE);

            Assert.assertEquals(nonNativeAssignmentType,
                    table.raw().get(2).get(1));
        }

        else if (Patch.equals("Remove Patch")) {

            String query = SerenityBase.queries.getProperty("Patch_Validation")
                    .replace("ClonedVer", clonedVer);

            response = Utility.getDbData(cluster1, query);

            removePatch = ResponseUtils.getDataFromResponseUsingJsonPath(
                    JsonPath.JSON_PATH_REMOVE_PATCH);

            Assert.assertEquals(removePatch,
                    JsonPath.JSON_PATH_NON_NATIVE_ASSERT_PATCH);

        } else if (Patch.equals("Update Title Patch")) {

            String query = SerenityBase.queries.getProperty("Patch_Validation")
                    .replace("ClonedVer", clonedVer);

            response = Utility.getDbData(cluster1, query);

            updateAssignmentTitle = ResponseUtils
                    .getDataFromResponseUsingJsonPath(
                            JsonPath.JSON_PATH_UPDATE_ASSIGNMENT_PATCH);

            Assert.assertEquals(updateAssignmentTitle,
                    table.raw().get(1).get(1));

        } else if (Patch.equals("Update Message Patch")) {

            String query = SerenityBase.queries.getProperty("Patch_Validation")
                    .replace("ClonedVer", clonedVer);

            response = Utility.getDbData(cluster1, query);

            addPatch = ResponseUtils.getDataFromResponseUsingJsonPath(
                    JsonPath.JSON_PATH_ADD_PATCH);

            Assert.assertEquals(addPatch, table.raw().get(1).get(1));

        }
    }

    @And("^Validate Non-Native Assignment \"([^\"]*)\" in \"([^\"]*)\" in couchbase \"([^\"]*)\" with$")
    public void
           validate_nonnative_assignment_something_in_something_in_couchbase_something_with(
                   String Patch, String microService, String cluster1,
                   DataTable table) throws Throwable {

        if (Patch.equals("Add Patch")) {

            String query = SerenityBase.queries.getProperty("Patch_Validation")
                    .replace("ClonedVer", clonedVer);

            response = Utility.getDbData(cluster1, query);

            nonNativeAddPatch = ResponseUtils.getDataFromResponseUsingJsonPath(
                    JsonPath.JSON_PATH_NON_NATIVE_ADD_PATCH);

            nonNativeAssignmentType = ResponseUtils
                    .getDataFromResponseUsingJsonPath(
                            JsonPath.JSON_PATH_NON_NATIVE_ASSIGNMENTTYPE);

            Assert.assertEquals(nonNativeAddPatch, table.raw().get(1).get(1));

            Assert.assertEquals(nonNativeAssignmentType,
                    table.raw().get(2).get(1));

        } else if (Patch.equals("Remove Patch")) {

            String query = SerenityBase.queries.getProperty("Patch_Validation")
                    .replace("ClonedVer", clonedVer);

            response = Utility.getDbData(cluster1, query);

            nonNativeRemovePatch = ResponseUtils
                    .getDataFromResponseUsingJsonPath(
                            JsonPath.JSON_PATH_NON_NATIVE_REMOVE_PATCH);
            nonNativeAssignmentType = ResponseUtils
                    .getDataFromResponseUsingJsonPath(
                            JsonPath.JSON_PATH_NON_NATIVE_ASSIGNMENTTYPE);

            Assert.assertEquals(nonNativeAssignmentType,
                    table.raw().get(1).get(1));

            Assert.assertEquals(nonNativeRemovePatch,
                    JsonPath.JSON_PATH_NON_NATIVE_ASSERT_PATCH);

        } else if (Patch.equals("Update Title Patch")) {

            String query = SerenityBase.queries.getProperty("Patch_Validation")
                    .replace("ClonedVer", clonedVer);

            response = Utility.getDbData(cluster1, query);

            updateAssignmentTitle = ResponseUtils
                    .getDataFromResponseUsingJsonPath(
                            JsonPath.JSON_PATH_UPDATE_ASSIGNMENT_PATCH);
            nonNativeAssignmentType = ResponseUtils
                    .getDataFromResponseUsingJsonPath(
                            JsonPath.JSON_PATH_NON_NATIVE_ASSIGNMENTTYPE);

            Assert.assertEquals(nonNativeAssignmentType,
                    table.raw().get(2).get(1));

            Assert.assertEquals(updateAssignmentTitle,
                    table.raw().get(1).get(1));

        } else if (Patch.equals("Update Message Patch")) {

            String query = SerenityBase.queries.getProperty("Patch_Validation")
                    .replace("ClonedVer", clonedVer);

            response = Utility.getDbData(cluster1, query);

            addPatch = ResponseUtils.getDataFromResponseUsingJsonPath(
                    JsonPath.JSON_PATH_NON_NATIVE_ADD_PATCH);
            nonNativeAssignmentType = ResponseUtils
                    .getDataFromResponseUsingJsonPath(
                            JsonPath.JSON_PATH_NON_NATIVE_ASSIGNMENTTYPE);

            Assert.assertEquals(nonNativeAssignmentType,
                    table.raw().get(2).get(1));

            Assert.assertEquals(addPatch, table.raw().get(1).get(1));

        } else if (Patch.equals("Assignment Template Patch")) {

            String query = SerenityBase.queries.getProperty("Patch_Validation")
                    .replace("ClonedVer", clonedVer);

            response = Utility.getDbData(cluster1, query);

            nonNativeAssignmentType = ResponseUtils
                    .getDataFromResponseUsingJsonPath(
                            JsonPath.JSON_PATH_NON_NATIVE_ASSIGNMENTTYPE);

            Assert.assertEquals(nonNativeAssignmentType,
                    table.raw().get(2).get(1));

            assignmentTemplate = ResponseUtils.getDataFromResponseUsingJsonPath(
                    JsonPath.JSON_PATH_ASSIGNMENT_TEMPLATE);

            Assert.assertEquals(assignmentTemplate, table.raw().get(1).get(1));

        }

    }

    @And("^Verify the response which is found in clone learning experience \"([^\"]*)\" with patch$")
    public void
           verify_the_response_which_is_found_in_clone_learning_experience_something_with_patch(
                   String AssetClass, DataTable table) throws Throwable {

        if (AssetClass.equals("ASSIGNMENT")) {

            Assert.assertNotEquals(clonedVer, CloneLearningExperience.leVer);

            Assert.assertEquals(clonedId, CloneLearningExperience.leId);

            Assert.assertEquals(clonedBssVer,
                    CloneLearningExperience.le_bssVer);

        }

        else if (AssetClass.equals("NONNATIVEASSIGNMENT"))

        {

            Assert.assertNotEquals(clonedVer, CreateLearningExperience.leVer);

            Assert.assertEquals(clonedId, CreateLearningExperience.leId);

            Assert.assertEquals(clonedBssVer,
                    CreateLearningExperience.le_bssVer);
        }

    }

    @And("^Check all course information is coming in response when query param returnEmbedded=true send with the clone version call$")
    public void
           check_all_course_information_is_coming_in_response_when_query_param_returnembeddedtrue_send_with_the_clone_version_call()
                   throws Throwable {

        Assert.assertEquals(
                ResponseUtils.getDataFromResponseUsingJsonPath(
                        JsonPath.JSON_PATH_VER_LE_MODEL),
                configurationsXlsMap.get("Assignment_LearningModelid"));
        Assert.assertEquals(ResponseUtils.getDataFromResponseUsingJsonPath(
                JsonPath.JSON_PATH_VER_LE_STATUS), "PRE_COMPOSED");
        Assert.assertEquals(
                ResponseUtils.getDataFromResponseUsingJsonPath(
                        JsonPath.JSON_PATH_VER_LE_ID),
                CreateLearningExperience.leId);
        Assert.assertEquals(
                ResponseUtils.getDataFromResponseUsingJsonPath(
                        JsonPath.JSON_PATH_VER_LE_VER),
                CreateLearningExperience.leVer);

    }

}