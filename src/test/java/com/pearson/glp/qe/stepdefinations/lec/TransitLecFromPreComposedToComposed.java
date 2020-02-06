package com.pearson.glp.qe.stepdefinations.lec;

import static com.pearson.glp.qe.utility.ResponseUtils.response;

import org.testng.Assert;

import com.pearson.glp.qe.base.SerenityBase;
import com.pearson.glp.qe.utility.ResponseUtils;
import com.pearson.glp.qe.utility.Utility;

import cucumber.api.java.en.And;

public class TransitLecFromPreComposedToComposed extends SerenityBase {

    UpdateLearningExperienceStausById learning_Id;
    String getStatus;

    @And("^the Update LE version data should be available in \"([^\"]*)\" in couchbase \"([^\"]*)\"$")

    @SuppressWarnings("static-access")
    public void
           the_Update_LE_version_data_should_be_availablein_LEC_in_couchbasecluster2(
                   String microService, String cluster1) {

        getStatus = "select * from lec where META().id = 'LE::VER::"
                + CreateLearningExperience.leVer + "'";
        response = Utility.getDbData(cluster1, getStatus);
        Assert.assertEquals(ResponseUtils
                .getDataFromResponseUsingJsonPath("results[0].lec._status")
                .toString(), "PRE_COMPOSED");

    }

}
