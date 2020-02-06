package com.pearson.glp.qe.utility;

import static org.hamcrest.Matchers.lessThan;

import io.restassured.module.jsv.JsonSchemaValidator;
import io.restassured.response.Response;

public class ResponseUtils {
	public static Response response;

	public static String getDataFromResponseUsingJsonPath(String jsonPath) {
		return response.then().extract().jsonPath().getString(jsonPath);
	}

	public static void assertReponseStatus(int expectedStatusCode) {
		response.prettyPrint();
		response.then().statusCode(expectedStatusCode);

	}

	// Here just pass the JSON schema from your step definition
	// It will validate the JSON Schema With The Response

	public static void validateJsonSchema(String schema) {
		response.prettyPrint();
		response.then().assertThat()
				.body(JsonSchemaValidator.matchesJsonSchema(Utility.readResponseJsonSchema(schema)));

	}

	public static void assertReponseTime(long time) {
		response.prettyPrint();
		response.then ()
		   .time (lessThan (time));

	}

}
