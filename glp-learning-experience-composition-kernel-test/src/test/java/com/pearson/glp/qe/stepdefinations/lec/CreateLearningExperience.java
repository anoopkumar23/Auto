package com.pearson.glp.qe.stepdefinations.lec;

import static com.pearson.glp.qe.utility.PropertyHolder.getProperty;
import static com.pearson.glp.qe.utility.PropertyHolder.setProperty;
import static com.pearson.glp.qe.utility.ResponseUtils.response;
import static io.restassured.config.EncoderConfig.encoderConfig;

import org.json.JSONArray;
import org.testng.Assert;

import com.pearson.glp.qe.base.SerenityBase;
import com.pearson.glp.qe.endpoints.JsonPath;
import com.pearson.glp.qe.utility.ResponseUtils;
import com.pearson.glp.qe.utility.SerenityServices;
import com.pearson.glp.qe.utility.Utility;

import cucumber.api.DataTable;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import io.restassured.RestAssured;
import net.serenitybdd.rest.SerenityRest;

public class CreateLearningExperience extends SerenityBase {

    public static String leId, leVer, le_bssVer;
    public static JSONArray couchbaseResponse;

    @Given("^I have the learning experience endpoint as \"([^\"]*)\"$")
    public void i_have_the_learning_experience_endpoint_as_something(String url)
            throws Throwable {
        setProperty("url",
                Utility.createEndPoint(
                        configurationsXlsMap.get(url.split("/")[0]),
                        getProperty(url.split("/")[1])));
    }

    @When("^I send the \"([^\"]*)\" request to \"([^\"]*)\" using request body as \"([^\"]*)\" with \"([^\"]*)\"$")
    public void
           i_send_the_something_request_to_something_using_request_body_as_something_with_something(
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

    @Then("^Schema should validate for POST LE$")
    public void schema_should_validate_for_POST_LE() {

        ResponseUtils
                .validateJsonSchema("GLP_45014_POST_Learning_exp_contract_res");

    }

    @Then("^Server should return \"([^\"]*)\" Status for LE$")
    public void server_should_return_something_Status_for_le(int status)
            throws Throwable {
        ResponseUtils.assertReponseStatus(status);

    }

    @And("^verify the error message as \"([^\"]*)\"$")
    public void verify_the_error_message_as_something(String strArg1)
            throws Throwable {

        String errorMessage = ResponseUtils
                .getDataFromResponseUsingJsonPath("errorDesc");
        Assert.assertEquals(errorMessage, strArg1);
    }

    @And("^I have the CouchBase response of query from \"([^\"]*)\"$")
    public void i_have_the_couchbase_response_of_query_from_something(
            String cluster) throws Throwable {

        String query = SerenityBase.queries.getProperty("query_lec").replace(
                "CreateLearningExperience.leVer",
                CreateLearningExperience.leVer);

        couchbaseResponse = Utility.getResultArrayFromCouchbaseResponse(
                Utility.getDbData(cluster, query));

    }

    @Then("^I should see following in the Couchbase response from \"([^\"]*)\" as$")
    public void
           i_should_see_following_in_the_Couchbase_response_from_something_as(
                   String bucket, DataTable table) throws Throwable {
        for (int i = 0; i < couchbaseResponse.length(); i++)

        {

            for (int j = 1; j < table.raw().size(); j++) {
                Utility.compareValues(
                        Utility.getKeyValueFromJsonUsingJsonPath(
                                couchbaseResponse.getJSONObject(i)
                                        .getJSONObject(bucket).toString(),
                                getProperty(table.raw().get(j).get(1)) == null
                                        ? table.raw().get(j).get(1)
                                        : getProperty(
                                                table.raw().get(j).get(1))),

                        getProperty(table.raw().get(j).get(2)) == null
                                ? table.raw().get(j).get(2)
                                : getProperty(table.raw().get(j).get(2)));
            }
        }
    }

}
