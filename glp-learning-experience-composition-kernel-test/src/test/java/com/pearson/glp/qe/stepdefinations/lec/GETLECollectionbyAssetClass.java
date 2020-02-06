package com.pearson.glp.qe.stepdefinations.lec;

import static com.pearson.glp.qe.utility.ResponseUtils.response;
import static org.assertj.core.api.Assertions.assertThat;

import java.util.HashMap;
import java.util.Map;

import org.junit.Assert;

import com.pearson.common.framework.api.core.SerenityRESTService;
import com.pearson.glp.qe.base.SerenityBase;
import com.pearson.glp.qe.builders.CommonSteps;
import com.pearson.glp.qe.endpoints.APIEndPoints;
import com.pearson.glp.qe.pojos.GetLearningExperience;
import com.pearson.glp.qe.utility.ResponseUtils;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import io.restassured.specification.RequestSpecification;
import net.thucydides.core.annotations.Steps;

public class GETLECollectionbyAssetClass extends SerenityBase {
    @Steps
    CommonSteps common;
    static String endPoint;
    RequestSpecification request;
    Map<String, String> headers = new HashMap<>();
    public static String getAssignmentId, getAssignmentVer;

    @Given("^Set the endpoint for GET LE Collection based on AssetClass & Scope Tags$")
    public void
           set_the_endpoint_for_get_le_collection_based_on_assetclass_scope_tags()
                   throws Throwable {
        endPoint = common.createEndPoint(configurationsXlsMap.get("DomainURL"),
                APIEndPoints.ENDPOINT_LEC_POST);
    }

    @And("^Validate LE status coming as PRE_COMPOSED$")
    public void validate_le_status_coming_as_PRE_COMPOSED() throws Throwable {
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

    @When("^User sends the request with \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" to GET LE collection$")
    public void
           user_sends_the_request_with_something_and_something_and_something_and_something_to_get_le_collection(
                   String assetclass, String scopeassetsid,
                   String scopeassetsbssver, String collectionDetails)
                   throws Throwable {

        HashMap<String, String> queryP = new HashMap<>();
        queryP.put("assetClass", assetclass);

        if (scopeassetsid.equals("Dynamic1")) {
            queryP.put("scope.assets._id",
                    GetLearningExperienceById.getLearningId);
        } else {
            queryP.put("scope.assets._id", scopeassetsid); // Passing Path param
        }

        if (scopeassetsbssver.equals("Dynamic2")) {
            queryP.put("scope.assets._bssVer",
                    GetLearningExperienceById.getLearningVer);
        } else {
            queryP.put("scope.assets._bssVer", scopeassetsbssver);
        }

        queryP.put("collectionDetails", collectionDetails);

        response = SerenityRESTService.getCallWithHeaderAndQueryParam(headers,
                queryP, endPoint, "JSON");

    }

    @And("^Verify that blank LE array with \"([^\"]*)\" is returned in response$")
    public void
           verify_that_blank_le_array_with_something_is_returned_in_response(
                   String count) throws Throwable {
        String getCount = ResponseUtils
                .getDataFromResponseUsingJsonPath("count");

        Assert.assertEquals(getCount, count);
    }

    @Then("^Schema should validate for GET LE Collection based on AssetClass & Scope Tags$")
    public void
           schema_should_validate_for_get_le_collection_based_on_assetclass_scope_tags()
                   throws Throwable {
        ResponseUtils.validateJsonSchema("GLP-48959_GET_LE_Collection");
    }

    @And("^Verify the \"([^\"]*)\" code for GET LE collection based on AssetClass & Scope Tags$")
    public void
           verify_the_something_code_for_get_le_collection_based_on_assetclass_scope_tags(
                   int StatusCode) throws Throwable {
        ResponseUtils.assertReponseStatus(StatusCode);
    }

    @Given("^Set the endpoint api contract for GET LE Collection based on AssetClass & Scope Tags$")
    public void
           set_the_endpoint_api_contract_for_get_le_collection_based_on_assetclass_scope_tags()
                   throws Throwable {
        endPoint = common.createEndPoint(configurationsXlsMap.get("DomainURL"),
                APIEndPoints.ENDPOINT_LEC_GET_LE_Collection_withAssetClass_scope_tags);
    }

    @When("^User sends the request with \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" to GET LE collection api contract$")
    public void
           user_sends_the_request_with_something_and_something_and_something_to_get_le_collection_api_contract(
                   String assetClass, String scopeassetsId,
                   String scopeassetsbssVer) throws Throwable {
        HashMap<String, String> queryParameter = new HashMap<>();
        queryParameter.put("assetClass", assetClass);
        queryParameter.put("scope.assets._id", scopeassetsId); // Passing Path
                                                               // parameter
                                                               // using
                                                               // Hashmap//
        queryParameter.put("scope.assets._bssVer", scopeassetsbssVer);
        response = SerenityRESTService.getCallWithHeaderAndQueryParam(headers,
                queryParameter, endPoint, "JSON");
    }

    @Then("^Schema should validate for api contract of GET LE Collection based on AssetClass & Scope Tags$")
    public void
           schema_should_validate_for_api_contract_of_get_le_collection_based_on_assetclass_scope_tags()
                   throws Throwable {
        ResponseUtils.validateJsonSchema("GLP-48959_GET_LE_Collection");
    }

    @And("^Verify the \"([^\"]*)\" code of api contract for GET LE collection based on AssetClass & Scope Tags$")
    public void
           verify_the_something_code_of_api_contract_for_get_le_collection_based_on_assetclass_scope_tags(
                   int StatusCode) throws Throwable {
        ResponseUtils.assertReponseStatus(StatusCode);
    }

    @And("^verify the assignment id present in response$")
    public void verify_the_assignment_id_present_in_response()
            throws Throwable {

        Assert.assertEquals(getAssignmentId, CreateLearningExperience.leId);
        Assert.assertEquals(getAssignmentVer, CreateLearningExperience.leVer);

    }

}
