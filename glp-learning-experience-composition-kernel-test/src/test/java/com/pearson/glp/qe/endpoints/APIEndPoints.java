package com.pearson.glp.qe.endpoints;

public class APIEndPoints {

    public static final String ENDPOINT_GET_CREATE_ACCOUNT_PROPS = "/piui/get-create-account-props";
    public static final String ENDPOINT_CREATE_ACCOUNT = "/login/createAccount/{EscrowId}";
    public static final String ENDPOINT_WEB_CREDENTIAL = "/login/webcredentials";
    public static final String ENDPOINT_CREDENTIAL_BY_USERNAME = "/credentials/";
    public static final String ENDPOINT_USER_COMPOSITE = "/usercomposite/{user_composite_id}";
    public static final String ENDPOINT_USER_IDENTITY_PROFILE = "/identityprofiles/{username}/emails/{email_id}";
    public static final String ENDPOINT_TOKENS = "/tokens";
    public static final String ENDPOINT_GROUPS = "/groups/{group_id}/members.json";
    public static final String ENDPOINT_CREATE_RESOURCE_ID_VERSIONS = "/resources/{idToBeReplaced}/versions";
    public static final String ENDPOINT_IAMSI_OAUTH = "/iamsi/v1/oauth/token";
    public static final String ENDPOINT_AUTOBAHN_EVENTS = "/autobahnpro/v1/messages/events";
    public static final String ENDPOINT_LEC_LABEL = "/lec/v1/label";
    public static final String ENDPOINT_LEC_GET = "/lec/v2/learningExperiences/{LEID}";
    public static final String ENDPOINT_STUB_LAP_RESOURCES = "/stub-lap/v2/resources/{ResourceID}/versions/{VersionID}";
    public static final String ENDPOINT_LEC_POST = "/lec/v2/learningExperiences";
    public static final String ENDPOINT_LEC_Publish_Learning_Exp = "/lec/v2/learningExperiences/{LEID}/stateTransitions";
    public static final String ENDPOINT_LEC_GET_Learning_Exp_Status = "/lec/v2/learningExperiences/{LEID}/status";
    public static final String ENDPOINT_LEC_Update_Learning_Exp = "/lec/v2/learningExperiences/{LEID}/versions";
    public static final String ENDPOINT_LEC_GET_LE_Collection_withAssetClass_scope_tags = "/stub-lec/lec/v2/learningExperiences";
    public static final String ENDPOINT_LEC_GET_Learning_Exp = "/stub-lec/lec/v2/learningExperiences/{LEID}";
    public static final String ENDPOINT_LEC_GET_Learning_Exp_Fxn = "/lec/v2/learningExperiences/{LEID}";
    public static final String ENDPOINT_LEC_CLONE = "/lec/v2/learningExperiences/{LEID}/clone";
    public static final String ENDPOINT_LEC_CLONE_VERSIONS = "/lec/v2/learningExperiences/{LEID}/versions/clone";


}
