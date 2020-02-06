package com.pearson.glp.qe.utility;

import org.junit.Assert;

import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;

public class SerenityServices {

    /**
     * Do request.
     *
     * @param requestSpec
     *            the request spec
     * @param methodType
     *            the method type
     * @param url
     *            the url
     * @return the response
     */
    public static Response doRequest(RequestSpecification requestSpec,
            String methodType, String url) {
        switch (methodType.toLowerCase()) {
        case "get":
            return requestSpec.log().all().get(url);
        case "post":
            return requestSpec.log().all().post(url);
        case "put":
            return requestSpec.log().all().put(url);
        case "delete":
            return requestSpec.log().all().delete(url);
        case "patch":
            return requestSpec.log().all().patch(url);
        default:
            Assert.assertTrue("Invalid method type passed: " + methodType,
                    false);
            return null;
        }
    }

}
