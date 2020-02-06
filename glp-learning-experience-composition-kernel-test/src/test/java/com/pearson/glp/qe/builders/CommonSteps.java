package com.pearson.glp.qe.builders;

import static com.pearson.glp.qe.utility.ResponseUtils.response;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import org.junit.Assert;

import com.pearson.common.framework.api.core.SerenityRESTService;
import com.pearson.glp.qe.base.SerenityBase;
import com.pearson.glp.qe.endpoints.APIEndPoints;
import com.pearson.glp.qe.endpoints.JsonPath;
import com.pearson.glp.qe.utility.ResponseUtils;
import com.pearson.glp.qe.utility.Utility;

import net.minidev.json.JSONObject;
import net.thucydides.core.annotations.Step;

public class CommonSteps extends SerenityBase {
    String url, base_url, escrowID;
    String AuthorizationToken;
    JSONObject jsonObject;
    private String jsonString;
    public static String user_name = Utility.getRandomUsername();

    @Step
    public String get_request_toFetch_EscrowId() throws Exception {
        String endPoint = createEndPoint(configurationsXlsMap.get("Pi_URL"),
                APIEndPoints.ENDPOINT_GET_CREATE_ACCOUNT_PROPS);
        response = SerenityRESTService.getCallWithContentType(endPoint, "json");
        APP_LOG.info("Response is - " + response.prettyPrint());
        return ResponseUtils
                .getDataFromResponseUsingJsonPath(JsonPath.JSON_PATH_ESCROW_ID);
    }

    @Step
    public void post_request_for_create_account(String authGroup, String uName,
            String escrowId) throws Exception {
        String endPoint = createEndPoint(configurationsXlsMap.get("Pi_URL"),
                APIEndPoints.ENDPOINT_CREATE_ACCOUNT);
        Map<String, Object> pathParam = new HashMap<String, Object>();
        pathParam.put("EscrowId", escrowId);
        Map<String, String> createConsoleUser = new HashMap<>();
        createConsoleUser.put("name", uName);
        createConsoleUser.put("auth_group", authGroup);
        jsonString = Utility.alterJson("learner.txt", createConsoleUser);
        response = SerenityRESTService.postCallWithJsonBodyAndPathParam(
                jsonString, pathParam, endPoint, "json");
        APP_LOG.info("Response is - " + response.prettyPrint());
    }

    @Step
    public void verify_status_for_create_account() throws Exception {
        Assert.assertEquals("201", response.statusCode());
        APP_LOG.info("Response is - " + response.statusCode());
    }

    @Step
    public String post_request_for_web_credentials_to_fetch_token(String uName)
            throws Exception {

        String strEndPoint = createEndPoint(configurationsXlsMap.get("Pi_URL"),
                APIEndPoints.ENDPOINT_WEB_CREDENTIAL);
        String timeStamp = new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss")
                .format(System.currentTimeMillis());
        Map<String, String> headers = new HashMap<String, String>();
        headers.put("ts", timeStamp);
        headers.put("grant_type", "password");
        headers.put("login_success_url", "https://console-qa.pearsoned.com");
        Map<String, String> formParam = new HashMap<String, String>();
        formParam.put("client_id", "KCpjnbqANB0RkI8aohz5uRBMAGeN5FGA");
        formParam.put("username", uName);
        formParam.put("password", "Password11");
        response = SerenityRESTService.postCallWithHeaderAndFormParam(headers,
                formParam, strEndPoint, "URLENC");
        APP_LOG.info("Response is - " + response.prettyPrint());
        return ResponseUtils.getDataFromResponseUsingJsonPath(
                JsonPath.JSON_PATH_WEBCREDENTIALS_ACCESS_TOKEN);
    }

    @Step
    public String get_web_credentials_token_and_userid(String uName,
            String accessToken) throws Exception {

        String strEndPoint = createEndPoint(
                configurationsXlsMap.get("OpenClass_URL"),
                APIEndPoints.ENDPOINT_CREDENTIAL_BY_USERNAME);
        Map<String, String> headers = new HashMap<String, String>();
        headers.put("X-Authorization", accessToken);
        Map<String, String> queryParams = new HashMap<String, String>();
        queryParams.put("username", uName);
        response = SerenityRESTService.getCallWithHeaderAndQueryParam(headers,
                queryParams, strEndPoint, "json");
        APP_LOG.info("Response is - " + response.prettyPrint());
        return ResponseUtils.getDataFromResponseUsingJsonPath(
                JsonPath.JSON_PATH_USER_COMPOSITE_ID);
    }

    @Step
    public String get_pi_email_id(String piId, String accessToken)
            throws Exception {

        String strEndPoint = createEndPoint(
                configurationsXlsMap.get("OpenClass_URL"),
                APIEndPoints.ENDPOINT_USER_COMPOSITE);
        Map<String, String> headers = new HashMap<String, String>();
        headers.put("X-Authorization", accessToken);
        Map<String, String> pathParam = new HashMap<String, String>();
        pathParam.put("user_composite_id", piId);
        response = SerenityRESTService.getCallWithHeaderAndPathParam(headers,
                pathParam, strEndPoint, "json");
        APP_LOG.info("Response is - " + response.prettyPrint());
        return ResponseUtils.getDataFromResponseUsingJsonPath(
                JsonPath.JSON_PATH_USER_EMAIL_ID);
    }

    @Step
    public void put_update_pi_email_flag(String piId, String piEmailId,
            String accessToken) throws Exception {

        String strEndPoint = createEndPoint(
                configurationsXlsMap.get("OpenClass_URL"),
                APIEndPoints.ENDPOINT_USER_IDENTITY_PROFILE);
        Map<String, String> headers = new HashMap<String, String>();
        headers.put("X-Authorization", accessToken);
        Map<String, String> pathParams = new HashMap<String, String>();
        pathParams.put("username", piId);
        pathParams.put("email_id", piEmailId);
        String body = Utility.readJson("emailFlag");
        response = SerenityRESTService.putCallWithHeaderAndPathParamAndJsonBody(
                headers, pathParams, body, strEndPoint, "json");
        APP_LOG.info("Response is - " + response.prettyPrint());
    }

    @Step
    public String createEndPoint(String base_url, String ApiEndpoint) {
        System.out.println(base_url + ApiEndpoint);
        return base_url + ApiEndpoint;
    }

    @Step
    public String getAuthorizationToken(String query,
            Map<String, String> headers) throws Exception {
        String endpoint = createEndPoint(configurationsXlsMap.get("DomainURL"),
                APIEndPoints.ENDPOINT_IAMSI_OAUTH);
        response = SerenityRESTService.postCallWithHeaderParam(headers,
                endpoint + "?" + query, "json");

        APP_LOG.info("Response is - " + response.prettyPrint());

        AuthorizationToken = ResponseUtils.getDataFromResponseUsingJsonPath(
                JsonPath.JSON_PATH_OAUTH_TOKEN);
        APP_LOG.info("JSON_PATH_OAUTH_TOKEN is - " + AuthorizationToken);
        return "Bearer " + AuthorizationToken;
    }

}
