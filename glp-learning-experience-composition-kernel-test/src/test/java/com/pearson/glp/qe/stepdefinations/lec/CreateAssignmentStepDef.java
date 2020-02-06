package com.pearson.glp.qe.stepdefinations.lec;

import static com.pearson.glp.qe.utility.PropertyHolder.getProperty;

import com.pearson.glp.qe.utility.ResponseUtils;
import com.pearson.glp.qe.utility.Utility;

import cucumber.api.DataTable;
import cucumber.api.java.en.Then;

public class CreateAssignmentStepDef {

    @Then("^I should see additional properties in response from \"([^\"]*)\"$")
    public void i_should_see_additional_properties_in_response_from_something(
            String bucket, DataTable table) throws Throwable {

        String link = ResponseUtils.getDataFromResponseUsingJsonPath(
                "learningExperiences[0].extends.sources[0]._links.self.href");

        String value = ResponseUtils.getDataFromResponseUsingJsonPath(
                "learningExperiences[0].extends.sources[0].extensions.value");

        String label = ResponseUtils.getDataFromResponseUsingJsonPath(
                "learningExperiences[0].extends.sources[0].label");

        for (int i = 0; i < CreateLearningExperience.couchbaseResponse
                .length(); i++)

        {

            Utility.compareValues(Utility.getKeyValueFromJsonUsingJsonPath(
                    CreateLearningExperience.couchbaseResponse.getJSONObject(i)
                            .getJSONObject(bucket).toString(),
                    getProperty(table.raw().get(3).get(1)) == null
                            ? table.raw().get(3).get(1)
                            : getProperty(table.raw().get(3).get(1))),
                    label);

            Utility.compareValues(Utility.getKeyValueFromJsonUsingJsonPath(
                    CreateLearningExperience.couchbaseResponse.getJSONObject(i)
                            .getJSONObject(bucket).toString(),
                    getProperty(table.raw().get(4).get(1)) == null
                            ? table.raw().get(4).get(1)
                            : getProperty(table.raw().get(4).get(1))),
                    value);

            Utility.compareValues(Utility.getKeyValueFromJsonUsingJsonPath(
                    CreateLearningExperience.couchbaseResponse.getJSONObject(i)
                            .getJSONObject(bucket).toString(),
                    getProperty(table.raw().get(5).get(1)) == null
                            ? table.raw().get(5).get(1)
                            : getProperty(table.raw().get(5).get(1))),
                    link);

        }

    }

}
