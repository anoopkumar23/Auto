package com.pearson.glp.qe.stepdefinations.lec;

import static com.pearson.glp.qe.utility.ResponseUtils.response;
import static org.assertj.core.api.Assertions.assertThat;

import java.net.URL;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import org.junit.Assert;

import com.pearson.common.framework.api.core.SerenityRESTService;
import com.pearson.glp.qe.base.SerenityBase;
import com.pearson.glp.qe.builders.CommonSteps;
import com.pearson.glp.qe.endpoints.APIEndPoints;
import com.pearson.glp.qe.pojos.GetLearningExperience;
import com.pearson.glp.qe.utility.ResponseUtils;
import com.pearson.glp.qe.utility.Utility;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import io.restassured.response.ResponseBody;
import io.restassured.specification.RequestSpecification;
import net.thucydides.core.annotations.Steps;

public class GetLearningExperienceCollection extends SerenityBase {
    @Steps
    CommonSteps common;
    static String endPoint;
    HashMap<String, String> pathp = new HashMap<>();
    RequestSpecification request;
    Map<String, String> headers = new HashMap<>();
    HashMap<String, String> queryParam = new HashMap<>();
    // HashMap<String, String> qParameter = new HashMap<>();
    HashMap<String, String> queryP = new HashMap<>();
    UpdateLearningExperienceStausById learning_Id;
    public static String sectionIdValue;
    public static String count, resCount;
    int nextOffsetDesired;

    @Given("^Set the endpoint for GET LE Collection$")

    public void set_the_endpoint_for_get_le_collection() throws Throwable {
        endPoint = common.createEndPoint(configurationsXlsMap.get("DomainURL"),
                APIEndPoints.ENDPOINT_LEC_POST);
    }

    @When("^User sends the request with \"([^\"]*)\" to GET LE collection$")
    public void user_sends_the_request_with_something_to_get_le_collection(
            String Method) throws Throwable {

        response = Utility.getCallWithPathParam(pathp, endPoint, "JSON");

        /*
         * else { response = SerenityRest.given()
         * .config(RestAssured.config().encoderConfig(encoderConfig()
         * .appendDefaultContentCharsetToContentTypeIfUndefined( false)))
         * .relaxedHTTPSValidation().headers(headers)
         * .contentType("application/json").body("").log().all().when()
         * .post(endPoint); }
         */

    }

    @Then("^Schema should validate for GET LE Collection$")
    public void schema_should_validate_for_get_le_collection()
            throws Throwable {
        ResponseUtils.validateJsonSchema("GLP-48959_GET_LE_Collection");

    }

    @When("^Set the endpoint for GET LE Collection with GarbledURL$")
    public void SettheendpointforGETLECollectionwithGarbledURL()
            throws Throwable {
        endPoint = common.createEndPoint(configurationsXlsMap.get("DomainURL"),
                APIEndPoints.ENDPOINT_LEC_POST);
        String gr_Url = endPoint + "/invalid/url";
        response = SerenityRESTService.getCallWithPathParam(pathp, gr_Url,
                "JSON");
        response.prettyPrint();

    }

    @And("^Verify the \"([^\"]*)\" code for LE collection$")
    public void verify_the_something_code_for_le_collection(int statuscode)
            throws Throwable {
        ResponseUtils.assertReponseStatus(statuscode);
    }

    @And("^Validate LE status coming as COMPOSED or PUBLISHED and \"([^\"]*)\"$")
    public void
           validate_le_status_coming_as_composed_or_published_and_something(
                   int size) throws Throwable {

        // Read all the LE as a List of String. Each item in the list
        try {
            GetLearningExperience objgetlearningexperience = response.then()
                    .extract().as(GetLearningExperience.class);
            assertThat(objgetlearningexperience.learningExperiences)
                    .extracting(
                            learningExperiences -> learningExperiences._status)
                    .containsAnyOf("COMPOSED", "PUBLISHED");

            assertThat(objgetlearningexperience.learningExperiences)
                    .extracting(
                            learningExperiences -> learningExperiences._status)
                    .hasSize(size);

        } catch (Exception e) {
            Assert.fail("Fields of response are not matching " + e);
        }

    }

    @When("^Send the request with \"([^\"]*)\" and \"([^\"]*)\"$")
    public void send_the_request_with_something_and_something(String limit,
            String offset) throws Throwable {
        HashMap<String, String> queryParam = new HashMap<>();
        queryParam.put("limit", limit);
        queryParam.put("offset", offset); // Passing Path parameter using
                                          // Hashmap
        response = SerenityRESTService.getCallWithHeaderAndQueryParam(headers,
                queryParam, endPoint, "JSON");
    }

    @When("^Send the request with \"([^\"]*)\" and \"([^\"]*)\" keys in uppercase$")
    public void send_the_request_with_something_and_something_keys_in_uppercase(
            String LIMIT, String OFFSET) throws Throwable {

        queryP.put("LIMIT", LIMIT);
        queryP.put("OFFSET", OFFSET); // Passing Path parameter using Hashmap
        response = SerenityRESTService.getCallWithHeaderAndQueryParam(headers,
                queryP, endPoint, "JSON");
    }

    @When("^User send the request to GET LE collection with \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\"$")

    public void user_send_the_request_to_GET_LE_collection_with_something(
            String sectionId, String LIMIT, String OFFSET) throws Throwable {
        HashMap<String, String> pathp = new HashMap<>();
        if (sectionId.equals("System")) {
            pathp.put("extensions.sectionId", sectionIdValue);
        } else {
            pathp.put("extensions.sectionId", sectionId); // Passing Path param
        }

        pathp.put("offset", OFFSET);

        pathp.put("limit", LIMIT);

        response = SerenityRESTService.getCallWithHeaderAndQueryParam(headers,
                pathp, endPoint, "JSON");
        resCount = ResponseUtils.getDataFromResponseUsingJsonPath("count");

    }

    @Then("^Verify the total number of count in response available in \"([^\"]*)\" in couchbase \"([^\"]*)\"$")
    public void
           Verify_the_total_number_of_count_in_response_available_in_something_in_couchbase_something(
                   String microService, String cluster1) throws Throwable {

        /*
         * count =
         * "select count(DISTINCT _id) from lec where extensions.sectionId='" +
         * sectionIdValue + "' AND _status in ['COMPOSED','PUBLISHED']";
         * response = Utility.getDbData(cluster1, count);
         * 
         * 
         * // APP_LOG.info("the couch base result is " + response);
         * 
         * String getCount = ResponseUtils
         * .getDataFromResponseUsingJsonPath("results[0].$1");
         */

        Assert.assertEquals("1", resCount);

    }

    @And("^Verify the Next Link present in response with \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\"$")
    public void
           verify_the_next_link_present_in_response_with_something_something_something(
                   String sectionId, String LIMIT, String OFFSET)
                   throws Throwable {

        String nextPageLink = ResponseUtils
                .getDataFromResponseUsingJsonPath("_links.next.href");

        resCount = ResponseUtils.getDataFromResponseUsingJsonPath("count")
                .toString();

        URL url = new URL("https://glp-qa.glp-internal.com" + nextPageLink);
        Map<String, String> query_pairs = new LinkedHashMap<String, String>();
        String query = url.getQuery();
        String[] pairs = query.split("&");
        for (String pair : pairs) {
            int idx = pair.indexOf("=");
            query_pairs.put(URLDecoder.decode(pair.substring(0, idx), "UTF-8"),
                    URLDecoder.decode(pair.substring(idx + 1), "UTF-8"));
        }

        int nextOffset = Integer.parseInt(OFFSET) + Integer.parseInt(LIMIT);

        Assert.assertEquals(Integer.parseInt(query_pairs.get("offset")),
                nextOffset);
        Assert.assertEquals(query_pairs.get("limit"), LIMIT);

    }

    @And("^Verify the Previous Link present in response with \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\"$")
    public void
           verify_the_Previous_Link_present_in_response_with_something_something_something(
                   String sectionId, String LIMIT, String OFFSET)
                   throws Throwable {

        String previousPageLink = ResponseUtils
                .getDataFromResponseUsingJsonPath("_links.previous.href");

        URL url = new URL("https://glp-qa.glp-internal.com" + previousPageLink);
        Map<String, String> query_pairs = new LinkedHashMap<String, String>();
        String query = url.getQuery();
        String[] pairs = query.split("&");
        for (String pair : pairs) {
            int idx = pair.indexOf("=");
            query_pairs.put(URLDecoder.decode(pair.substring(0, idx), "UTF-8"),
                    URLDecoder.decode(pair.substring(idx + 1), "UTF-8"));
        }

        nextOffsetDesired = Integer.parseInt(OFFSET) - Integer.parseInt(LIMIT);

        if (nextOffsetDesired < 0) {
            nextOffsetDesired = 0;
        }

        Assert.assertEquals(Integer.parseInt(query_pairs.get("offset")),
                nextOffsetDesired);
        Assert.assertEquals(query_pairs.get("limit"), LIMIT);
    }

    @And("^Verify the Self Link present in response with \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\"$")
    public void
           verify_the_Self_Link_present_in_response_with_something_something_something(
                   String sectionId, String LIMIT, String OFFSET)
                   throws Throwable {

        String selfPageLink = ResponseUtils
                .getDataFromResponseUsingJsonPath("_links.self.href");

        URL url = new URL("https://glp-qa.glp-internal.com" + selfPageLink);
        Map<String, String> query_pairs = new LinkedHashMap<String, String>();
        String query = url.getQuery();
        String[] pairs = query.split("&");
        for (String pair : pairs) {
            int idx = pair.indexOf("=");
            query_pairs.put(URLDecoder.decode(pair.substring(0, idx), "UTF-8"),
                    URLDecoder.decode(pair.substring(idx + 1), "UTF-8"));
        }

        int selfOffset = Integer.parseInt(OFFSET);
        int selfLimit = Integer.parseInt(LIMIT);

        Assert.assertEquals(Integer.parseInt(query_pairs.get("offset")),
                selfOffset);
        Assert.assertEquals(Integer.parseInt(query_pairs.get("limit")),
                selfLimit);
    }

    @And("^Verify the Previous Link not present in response with \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\"$")
    public void
           verify_the_Previous_Link_not_present_in_response_with_something_something_something(
                   String sectionId, String LIMIT, String OFFSET)
                   throws Throwable {
        @SuppressWarnings("rawtypes")
        ResponseBody body = response.getBody();

        // To check for sub string presence get the Response body as a String.
        // Do a String.contains
        String bodyAsString = body.asString();
        Assert.assertEquals(bodyAsString.contains("previous"), false);

    }

    @And("^Verify the Next Link not present in response with \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\"$")
    public void
           verify_the_Next_Link_not_present_in_response_with_something_something_something(
                   String sectionId, String LIMIT, String OFFSET)
                   throws Throwable {

        HashMap<String, String> pathp = new HashMap<>();
        if (sectionId.equals("System")) {
            pathp.put("extensions.sectionId", sectionIdValue);
        } else {
            pathp.put("extensions.sectionId", sectionId); // Passing Path param
        }

        int getOffset = Integer.parseInt(resCount) - 5;

        String s = String.valueOf(getOffset);

        pathp.put("offset", s);

        pathp.put("limit", LIMIT);

        response = SerenityRESTService.getCallWithHeaderAndQueryParam(headers,
                pathp, endPoint, "JSON");
        @SuppressWarnings("rawtypes")
        ResponseBody body = response.getBody();

        // To check for sub string presence get the Response body as a String.
        // Do a String.contains
        String bodyAsString = body.asString();
        Assert.assertEquals(bodyAsString.contains("next"), false);

    }

    @When("^User send the request to GET LE collection with \"([^\"]*)\"$")

    public void user_send_the_request_to_GET_LE_collection_with_something(
            String sectionId) throws Throwable {
        HashMap<String, String> queryparametr = new HashMap<>();
        if (sectionId.equals("System")) {
            queryparametr.put("extensions.sectionId", sectionIdValue);
        } else
            queryparametr.put("extensions.sectionId", sectionId); // Passing
                                                                  // Path
        // parameter using
        // Hashmap

        response = SerenityRESTService.getCallWithHeaderAndQueryParam(headers,
                queryparametr, endPoint, "JSON");

        resCount = ResponseUtils.getDataFromResponseUsingJsonPath("count");

        // response = SerenityRESTService.// Calling function written
        // already

    }

    @When("^User send the request to GET LE collection with \"([^\"]*)\" & \"([^\"]*)\" & \"([^\"]*)\"$")

    public void user_send_the_request_to_GET_LE_collection_with(
            String sectionId, String latest, String embed) throws Throwable {
        HashMap<String, String> pathp = new HashMap<>();
        if (sectionId.equals("System")) {
            pathp.put("extensions.sectionId", sectionIdValue);
        } else
            pathp.put("extensions.sectionId", sectionId); // Passing Path
                                                          // parameter using
                                                          // Hashmap

        pathp.put("latest", latest);
        // pathp.put("embed", embed);

        response = SerenityRESTService.getCallWithHeaderAndQueryParam(headers,
                pathp, endPoint, "JSON");

        // response = SerenityRESTService.// Calling function written
        // already

    }

    // public void learning_id_returned_should_equal_leid()

    @And("^Verify the \"([^\"]*)\" of LE for LE collection$")
    public void verify_the_something_of_le_for_collection(int count)
            throws Throwable {

        int getCountForInvalidSectionId = Integer.parseInt(
                ResponseUtils.getDataFromResponseUsingJsonPath("count"));

        Assert.assertEquals(count, getCountForInvalidSectionId);

    }

    @And("^Verify the json schema in response for GET LE collection with sectionID$")
    public void
           verify_the_json_schema_in_response_for_get_le_collection_with_sectionid()
                   throws Throwable {

        ResponseUtils.validateJsonSchema("GLP-48959_GET_LE_Collection");
    }

    @And("^the Get LE data should be available in \"([^\"]*)\" in couchbase \"([^\"]*)\"$")
    public void
           the_Get_LE_data_should_be_available_in_LEC_in_something_in_couchbase_something(
                   String microService, String cluster1) throws Throwable {

        String query = SerenityBase.queries.getProperty("query_LE_Collection")
                .replace("leVer", CreateLearningExperience.leVer);

        APP_LOG.info("sectionid is " + query);

        response = Utility.getDbData(cluster1, query);

        APP_LOG.info("the couch base result is  " + response);

        sectionIdValue = ResponseUtils
                .getDataFromResponseUsingJsonPath("results[0].sectionId");

        APP_LOG.info("sectionId is - " + sectionIdValue);

    }

    @And("^Verify the \"([^\"]*)\" of Learning Experience in response$")
    public void verify_the_something_of_learning_experience_in_response(
            int Count) throws Throwable {

        int getCount = Integer.parseInt(
                ResponseUtils.getDataFromResponseUsingJsonPath("count"));
        Assert.assertEquals(Count, getCount);

    }

    @And("^Verify that json response contains the columns passed in collectionDetails filter$")
    public void
           verify_that_json_response_contains_the_columns_passed_in_collectiondetails_filter()
                   throws Throwable {
        @SuppressWarnings("rawtypes")
        ResponseBody body = response.getBody();
        String bodyAsString = body.asString();
        Assert.assertEquals(bodyAsString.contains("_created"), true);
        Assert.assertNotNull("_created");
        Assert.assertEquals(bodyAsString.contains("_lastModified"), true);
        Assert.assertNotNull("_lastModified");
        Assert.assertEquals(bodyAsString.contains("expiresOn"), true);
        Assert.assertNotNull("expiresOn");
        Assert.assertEquals(bodyAsString.contains("tags"), true);
        Assert.assertNotNull("tags");
        Assert.assertEquals(bodyAsString.contains("language"), true);
        Assert.assertNotNull("language");
        Assert.assertEquals(bodyAsString.contains("_docType"), true);
        Assert.assertNotNull("_docType");

    }

    @When("^User send the request to GET LE collection with \"([^\"]*)\" and \"([^\"]*)\"$")
    public void
           user_send_the_request_to_get_le_collection_with_something_and_something(
                   String sectionId, String collectionDetails)
                   throws Throwable {
        HashMap<String, String> queryparameter = new HashMap<>();
        if (sectionId.equals("System")) {
            queryparameter.put("extensions.sectionId", sectionIdValue);
        } else
            queryparameter.put("extensions.sectionId", sectionId);
        queryparameter.put("collectionDetails", collectionDetails);
        // Passing Path parameter using Hashmap
        response = SerenityRESTService.getCallWithHeaderAndQueryParam(headers,
                queryparameter, endPoint, "JSON");
    }

    @When("^User send the request to GET Learning Experience collection with \"([^\"]*)\" and \"([^\"]*)\"$")
    public void
           user_send_the_request_to_get_learning_experience_collection_with_something_and_something(
                   String sectionId, String embed) throws Throwable {
        HashMap<String, String> pathparam = new HashMap<>();
        if (sectionId.equals("System")) {
            pathparam.put("extensions.sectionId", sectionIdValue);
        } else
            pathparam.put("extensions.sectionId", sectionId);
        pathparam.put("embed", embed);
        // Passing Path parameter using Hashmap
        response = SerenityRESTService.getCallWithHeaderAndQueryParam(headers,
                pathparam, endPoint, "JSON");
    }

    @When("^User send the request to GET Learning Experience collection with \"([^\"]*)\" incorrect filter$")
    public void
           user_send_the_request_to_get_learning_experience_collection_with_something_incorrect_filter(
                   String sectionId) throws Throwable {
        HashMap<String, String> pathp = new HashMap<>();
        if (sectionId.equals("System")) {
            pathp.put("sectionId", sectionIdValue);
        } else
            pathp.put("sectionId", sectionId);

        // Passing Path parameter using Hashmap
        response = SerenityRESTService.getCallWithHeaderAndQueryParam(headers,
                pathp, endPoint, "JSON");

    }

    @And("^Verify that json response contains all the fields in response for the learning experience returned$")
    public void
           verify_that_json_response_contains_all_the_fields_in_response_for_the_learning_experience_returned()
                   throws Throwable {
        ResponseUtils.validateJsonSchema("GLP-521463");

    }

}
