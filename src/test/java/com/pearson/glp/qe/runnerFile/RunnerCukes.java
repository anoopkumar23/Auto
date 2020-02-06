package com.pearson.glp.qe.runnerFile;

import org.junit.runner.RunWith;

import com.pearson.glp.qe.base.SerenityBase;

import cucumber.api.CucumberOptions;
import net.serenitybdd.cucumber.CucumberWithSerenity;

@RunWith(CucumberWithSerenity.class)
@CucumberOptions(strict = false, features = "src/test/resources/features/LEC",

        glue = { "com.pearson.glp.qe.stepdefinations" },

        tags = { "@Regression" },

        /*
         * plugin = { "json:target/cucumber-json-report.json",
         * "html:target/cucumber-html-report" })
         */

        plugin = { "pretty", "html:target/cucumber",
                "json:target/cucumber.json", "junit:target/cucumber.xml" })

public class RunnerCukes extends SerenityBase {

}
