package com.pearson.glp.qe.utility;

import static com.pearson.glp.qe.utility.PropertyHolder.getProperty;

import java.lang.reflect.Field;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import java.util.TimeZone;
import java.util.UUID;

import org.everit.json.schema.Schema;
import org.everit.json.schema.loader.SchemaLoader;
import org.json.JSONArray;
import org.json.JSONObject;
import org.json.JSONTokener;
import org.junit.Assert;

import com.google.common.base.Charsets;
import com.google.common.io.Resources;
import com.jayway.jsonpath.Configuration;
import com.jayway.jsonpath.DocumentContext;
import com.jayway.jsonpath.JsonPath;
import com.pearson.common.framework.shared.exception.CustomException;
import com.pearson.glp.qe.base.SerenityBase;
import com.pearson.glp.qe.stepdefinations.lec.CreateLearningExperience;

import cucumber.api.DataTable;
import io.restassured.config.RestAssuredConfig;
import io.restassured.config.SSLConfig;
import io.restassured.http.ContentType;
import io.restassured.response.Response;
import net.serenitybdd.rest.SerenityRest;

public class Utility extends SerenityBase {

    /**
     * @author Abhishek.Sharda
     * @description Method to alter the desired key values in the JSON and
     *              returning the JSON as string
     * @return alteredJson as string
     */

    public static Response getCallWithPathParam(Map<String, String> pathParams,
            String URL, String contentType) {
        return SerenityRest.given().relaxedHTTPSValidation()
                .contentType(getContentType(contentType)).pathParams(pathParams)
                .log().all().get(URL);
    }

    private static ContentType getContentType(String contentType) {
        if (contentType.equalsIgnoreCase("JSON")) {
            return ContentType.JSON;
        }
        if (contentType.equalsIgnoreCase("URLENC")) {
            return ContentType.URLENC;
        }
        if (contentType.equalsIgnoreCase("TEXT")) {
            return ContentType.TEXT;
        }
        if (contentType.equalsIgnoreCase("HTML")) {
            return ContentType.HTML;
        }
        if (contentType.equalsIgnoreCase("BINARY")) {
            return ContentType.BINARY;
        }
        if (contentType.equalsIgnoreCase("XML")) {
            return ContentType.XML;
        }
        if (contentType.equalsIgnoreCase("")) {
            return ContentType.JSON;
        }
        if (contentType.equalsIgnoreCase("Any")) {
            return ContentType.ANY;
        } else
            throw new CustomException(
                    "Not a valid Content Type, Please set the valid Content Type");
    }

    public static synchronized String alterJson(String jsonName,
            Map<String, String> jsonValues) {
        String jsonString = null;
        try {
            URL file = Resources.getResource(
                    "configFiles/jsonFiles/RequestJson/" + jsonName);
            jsonString = Resources.toString(file, Charsets.UTF_8);

            for (Map.Entry<String, String> keyVal : jsonValues.entrySet()) {
                jsonString = jsonString.replaceAll(keyVal.getKey(),
                        keyVal.getValue());
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonString;
    }

    public static void validateJsonSchema(JSONObject response,
            String jsonName) {
        try {
            // InputStream inputStream = response.asInputStream();
            JSONObject reponseSchema = response; // new JSONObject(new
                                                 // JSONTokener(inputStream));
            JSONObject expectedJsonSchema = new JSONObject(
                    new JSONTokener(Resources
                            .getResource(
                                    "configFiles/jsonFiles/ResponseJsonSchema/"
                                            + jsonName + ".json")
                            .openStream()));
            Schema schema = SchemaLoader.load(expectedJsonSchema);
            schema.validate(reponseSchema);
        } catch (Exception e) {
            Assert.assertFalse(
                    "Error while validating response json schema: " + e, true);

        }
    }

    public static String getRandomUsername() {
        String alphaNumeric = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
        StringBuilder userName = new StringBuilder();
        userName.append("qa-glp-");
        Random rnd = new Random();
        while (userName.length() < 18) { // length of the random string.
            int index = (int) (rnd.nextFloat() * alphaNumeric.length());
            userName.append(alphaNumeric.charAt(index));
        }

        return userName.toString();
    }

    public static String readJson(String jsonName) {
        try {
            URL file = Resources.getResource(
                    "configFiles/jsonFiles/RequestJson/" + jsonName + ".txt");
            String jsonString = Resources.toString(file, Charsets.UTF_8);
            return jsonString;
        } catch (Exception e) {

            System.out.println("Error while altering json : " + e);
            return null;
        }
    }

    public static String createEndPoint(String base_url, String ApiEndpoint) {
        System.out.println(base_url + ApiEndpoint);
        return base_url + ApiEndpoint;
    }

    public static String readResponseJsonSchema(String jsonSchema) {
        try {
            URL file = Resources
                    .getResource("configFiles/jsonFiles/ResponseJsonSchema/"
                            + jsonSchema + ".json");
            String jsonString = Resources.toString(file, Charsets.UTF_8);
            return jsonString;
        } catch (Exception e) {

            System.out.println("Error while altering json : " + e);
            return null;
        }
    }

    public static void putVariablesInMap(
            @SuppressWarnings("rawtypes") Class clz) throws Exception {
        Field[] fields = clz.getFields();
        for (Field field : fields) {
            PropertyHolder.setProperty(field.getName(),
                    (String) field.get(field));
        }
    }

    public static Map<String, String>
           getMapFromDataTableUsingKey(DataTable table, String key) {
        Map<String, String> map = new HashMap<String, String>();
        for (int i = 0; i < table.raw().size(); i++) {
            if (table.raw().get(i).get(0).equalsIgnoreCase(key)) {
                map.put(table.raw().get(i).get(1),
                        PropertyHolder
                                .getProperty(table.raw().get(i).get(2)) == null
                                        ? table.raw().get(i).get(2)
                                        : PropertyHolder.getProperty(
                                                table.raw().get(i).get(2)));
            }
        }
        return map;
    }

    public static String getContentTypeFromDataTable(DataTable table) {
        String contentType = null;
        for (int i = 0; i < table.raw().size(); i++) {
            if (table.raw().get(i).get(0).equalsIgnoreCase("contenttype")) {
                contentType = table.raw().get(i).get(1);
            }
        }
        return contentType;
    }

    public static void compareValues(String actualValue, String expectedValue) {
        Assert.assertTrue(
                "Values are not matching, expected value: " + expectedValue
                        + ", but was: " + actualValue,
                expectedValue.equals(actualValue));
    }

    public static Response getDbData(String cluster, String query) {
        System.out.println("===>" + query);
        String url = configurationsXlsMap.get(cluster);

        RestAssuredConfig rac = SerenityRest.config().sslConfig(new SSLConfig()
                .allowAllHostnames().relaxedHTTPSValidation("TLSv1.2"));
        Response authenticationResponse = SerenityRest.given()
                .contentType("application/x-www-form-urlencoded")
                .formParam("user", configurationsXlsMap.get("dbUser"))
                .formParam("password", configurationsXlsMap.get("dbPassword"))
                .config(rac).log().all().post(url + "/uilogin");

        authenticationResponse.then().statusCode(200);

        Response queryResponse = SerenityRest.given()
                .contentType("application/x-www-form-urlencoded")
                .cookies(authenticationResponse.cookies())
                .formParam("statement", query).config(rac).log().all()
                .post(url + "/_p/query/query/service");
        queryResponse.prettyPrint();
        queryResponse.then().statusCode(200);

        return queryResponse;
    }

    public static String generateRandomUUID() {
        String uuid = UUID.randomUUID().toString();
        System.out.println("Generated UUID : " + uuid);
        return uuid;
    }

    public static String readJsonSchema(String jsonName) {
        try {
            URL file = Resources
                    .getResource("configFiles/jsonFiles/ResponseJsonSchema/"
                            + jsonName + ".json");
            String jsonString = Resources.toString(file, Charsets.UTF_8);
            return jsonString;
        } catch (Exception e) {

            System.out.println("Error while altering json : " + e);
            return null;
        }
    }

    public static Object RemoveKeyFromJsonObject(String jsonbody,
            String JPath) {
        String ReqObj = null;
        try {
            Object document = Configuration.defaultConfiguration()
                    .jsonProvider().parse(jsonbody);
            DocumentContext UpdateJson = com.jayway.jsonpath.JsonPath
                    .parse(document)
                    .delete(PropertyHolder.getProperty(JPath) == null ? JPath
                            : PropertyHolder.getProperty(JPath));
            ReqObj = UpdateJson.jsonString();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ReqObj;
    }

    public static Object UpdateKeyValueAsStringInJsonObject(String jsonbody,
            String JPath, String value) {
        String ReqObj = null;
        try {
            Object document = Configuration.defaultConfiguration()
                    .jsonProvider().parse(jsonbody);
            DocumentContext UpdateJson = com.jayway.jsonpath.JsonPath
                    .parse(document).set(
                            (PropertyHolder.getProperty(JPath) == null ? JPath
                                    : PropertyHolder.getProperty(JPath)),
                            value);
            ReqObj = UpdateJson.jsonString();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ReqObj;
    }

    public static void validateJsonSchemaUsingJsonObject(JSONObject response,
            JSONObject jsonSchema) {
        try {
            Schema schema = SchemaLoader.load(jsonSchema);
            schema.validate(response);
        } catch (Exception e) {
            Assert.assertFalse(
                    "Error while validating response json schema: " + e, true);

        }
    }

    public static String getInvalidUUID() {
        return generateRandomUUID().substring(0, 10);
    }

    public static String getDateAndTimeInUTC() {
        SimpleDateFormat format = new SimpleDateFormat(
                "yyyy-MM-dd'T'hh:mm:ssZ");
        format.setTimeZone(TimeZone.getTimeZone("UTC"));
        return format.format(new Date());
    }

    public static Map<String, String> setValuesInMap(Map<String, String> map) {
        for (Map.Entry<String, String> entry : map.entrySet()) {
            if (entry.getValue().equalsIgnoreCase("Invalid UUID")) {
                map.put(entry.getKey(), getInvalidUUID());
            } else if (entry.getValue().equalsIgnoreCase("Valid UUID")) {
                map.put(entry.getKey(), getInvalidUUID());
            } else if (entry.getValue().equalsIgnoreCase("Valid date")) {
                map.put(entry.getKey(), getDateAndTimeInUTC());
            }
        }
        return map;

    }

    public static JSONArray
           getResultArrayFromCouchbaseResponse(Response response) {
        return new JSONObject(response.asString()).getJSONArray("results");

    }

    public static String updateKeyValueInJson(String jsonbody, String jsonPath,
            String valueToBeUpdated) {
        String object;
        DocumentContext UpdateJson = null;
        try {

            Object document = Configuration.defaultConfiguration()
                    .jsonProvider().parse(jsonbody);
            switch (checkDataTypeOfValue(valueToBeUpdated).toLowerCase()) {
            case "string":
                UpdateJson = JsonPath.parse(document).set(
                        PropertyHolder.getProperty(jsonPath) == null ? jsonPath
                                : PropertyHolder.getProperty(jsonPath),
                        checkIfGivenStringIsSomeKeyword(valueToBeUpdated));
                APP_LOG.info("updated String value for "
                        + (PropertyHolder.getProperty(jsonPath) == null
                                ? jsonPath
                                : PropertyHolder.getProperty(jsonPath))
                        + " as " + valueToBeUpdated);
                break;
            case "int":
                UpdateJson = JsonPath.parse(document).set(
                        PropertyHolder.getProperty(jsonPath) == null ? jsonPath
                                : PropertyHolder.getProperty(jsonPath),
                        Integer.parseInt(checkIfGivenStringIsSomeKeyword(
                                valueToBeUpdated)));
                APP_LOG.info("updated int value for "
                        + PropertyHolder.getProperty(jsonPath) == null
                                ? jsonPath
                                : PropertyHolder.getProperty(jsonPath) + " as "
                                        + valueToBeUpdated);
                break;
            case "float":
                UpdateJson = JsonPath.parse(document).set(
                        PropertyHolder.getProperty(jsonPath) == null ? jsonPath
                                : PropertyHolder.getProperty(jsonPath),
                        Float.parseFloat(checkIfGivenStringIsSomeKeyword(
                                valueToBeUpdated)));
                APP_LOG.info("updated float value for "
                        + PropertyHolder.getProperty(jsonPath) == null
                                ? jsonPath
                                : PropertyHolder.getProperty(jsonPath) + " as "
                                        + valueToBeUpdated);
                break;
            case "boolean":
                UpdateJson = JsonPath.parse(document).set(
                        PropertyHolder.getProperty(jsonPath) == null ? jsonPath
                                : PropertyHolder.getProperty(jsonPath),
                        Boolean.parseBoolean(checkIfGivenStringIsSomeKeyword(
                                valueToBeUpdated)));
                APP_LOG.info("updated boolean value for "
                        + PropertyHolder.getProperty(jsonPath) == null
                                ? jsonPath
                                : PropertyHolder.getProperty(jsonPath) + " as "
                                        + valueToBeUpdated);
                break;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        object = UpdateJson.jsonString();
        return object;
    }

    public static String getKeyValueFromJsonUsingJsonPath(JSONObject jsonObject,
            String jsonPath) {
        String UpdateJson = null;
        try {

            Object document = Configuration.defaultConfiguration()
                    .jsonProvider().parse(jsonObject.toString());
            UpdateJson = JsonPath.parse(document)
                    .read(PropertyHolder.getProperty(jsonPath) == null
                            ? jsonPath
                            : PropertyHolder.getProperty(jsonPath));

            APP_LOG.info("Got key value for " + jsonPath + " as " + UpdateJson);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return UpdateJson;
    }

    public static int getKeyValueAsIntFromJsonObject(JSONObject jsonObject,
            String JPath) {
        int ReqObj = 0;
        try {
            Object document = Configuration.defaultConfiguration()
                    .jsonProvider().parse(jsonObject.toString());
            ReqObj = com.jayway.jsonpath.JsonPath.parse(document)
                    .read(PropertyHolder.getProperty(JPath) == null ? JPath
                            : PropertyHolder.getProperty(JPath));
            // ReqObj = UpdateJson.jsonString();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ReqObj;
    }

    public static JSONObject addKeyInJson(JSONObject jsonObject, String jPath,
            String keyValue) {
        JSONObject reqObj = null;
        try {

            Object document = Configuration.defaultConfiguration()
                    .jsonProvider().parse(jsonObject.toString());
            Object addObject = Configuration.defaultConfiguration()
                    .jsonProvider().parse(keyValue.split("-")[1]);
            System.out.println(addObject);
            DocumentContext UpdateJson = com.jayway.jsonpath.JsonPath
                    .parse(document)
                    .put(jPath, keyValue.split("-")[0], addObject);
            reqObj = new JSONObject(UpdateJson.jsonString());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return reqObj;
    }

    public static String checkDataTypeOfValue(String value) {
        String flag = null;

        if (flag == null) {
            try {
                Integer.parseInt(value);
                flag = "int";
            }

            catch (Exception e) {
            }
        }
        if (flag == null) {
            try {

                Float.parseFloat(value);
                flag = "float";
            }

            catch (Exception e) {
            }
        }

        if (flag == null && (value.equalsIgnoreCase("true")
                || value.equalsIgnoreCase("false"))) {
            try {

                Boolean.parseBoolean(value);
                flag = "boolean";
            }

            catch (Exception e) {
            }
        }
        if (flag == null)
            flag = "String";
        System.out.println("=======66666" + flag);
        return flag;

    }

    public static String checkIfGivenStringIsSomeKeyword(String keyword) {
        if (keyword.contains("Invalid UUID")) {
            PropertyHolder.setProperty(keyword, getInvalidUUID());
        } else if (keyword.contains("Valid UUID")) {
            PropertyHolder.setProperty(keyword, generateRandomUUID());
        } else if (keyword.contains("Valid date")) {
            PropertyHolder.setProperty(keyword, getDateAndTimeInUTC());
        }
        return PropertyHolder.getProperty(keyword) == null ? keyword
                : PropertyHolder.getProperty(keyword);

    }

    public static String updateRequestBody(DataTable table, String jsonBody) {
        jsonBody = Utility.readJson(jsonBody);

        for (int i = 1; i < table.raw().size(); i++) {
            if (table.raw().get(i).get(0)
                    .equalsIgnoreCase("key to be update")) {
                jsonBody = Utility.updateKeyValueInJson(jsonBody,
                        table.raw().get(i).get(1), table.raw().get(i).get(2))
                        .toString();
            } else if (table.raw().get(i).get(0)
                    .equalsIgnoreCase("key to be add")) {
                jsonBody = Utility.addKeyInJson(new JSONObject(jsonBody),
                        table.raw().get(i).get(1), table.raw().get(i).get(2))
                        .toString();
            } else if (table.raw().get(i).get(0)
                    .equalsIgnoreCase("key to be remove")) {
                jsonBody = Utility.RemoveKeyFromJsonObject(jsonBody,
                        table.raw().get(i).get(1)).toString();
            } else if (table.raw().get(i).get(0)
                    .equalsIgnoreCase("key from excel")) {
                jsonBody = Utility
                        .updateKeyValueInJson(jsonBody,
                                table.raw().get(i).get(1),
                                configurationsXlsMap
                                        .get(table.raw().get(i).get(2)))
                        .toString();
            } else if (table.raw().get(i).get(0)
                    .equalsIgnoreCase("Random value")) {
                jsonBody = Utility.updateKeyValueInJson(jsonBody,
                        table.raw().get(i).get(1), Utility.getRandomUsername())
                        .toString();
            } else if (table.raw().get(i).get(0)
                    .equalsIgnoreCase("Id from create Course")) {
                jsonBody = Utility.updateKeyValueInJson(jsonBody,
                        table.raw().get(i).get(1),
                        CreateLearningExperience.leId).toString();
            }

            else if (table.raw().get(i).get(0)
                    .equalsIgnoreCase("version from create Course")) {
                jsonBody = Utility.updateKeyValueInJson(jsonBody,
                        table.raw().get(i).get(1),
                        CreateLearningExperience.leVer).toString();
            } else if (table.raw().get(i).get(0)
                    .equalsIgnoreCase("bss version from create Course")) {
                jsonBody = Utility.updateKeyValueInJson(jsonBody,
                        table.raw().get(i).get(1),
                        CreateLearningExperience.le_bssVer).toString();
            }
        }
        return jsonBody;

    }

    public static String getKeyValueFromJsonUsingJsonPath(String json,
            String jsonPath) {
        String updateJson = null;
        try {

            Object document = Configuration.defaultConfiguration()
                    .jsonProvider().parse(json);
            updateJson = JsonPath.parse(document)
                    .read(getProperty(jsonPath) == null ? jsonPath
                            : getProperty(jsonPath));

            APP_LOG.info("Got key value for " + jsonPath + " as " + updateJson);

        } catch (Exception e) {
            Assert.assertTrue(e.getMessage(), false);
        }
        return updateJson;
    }

}