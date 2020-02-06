package com.pearson.glp.qe.base;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;

import com.pearson.glp.qe.endpoints.APIEndPoints;
import com.pearson.glp.qe.endpoints.JsonPath;
import com.pearson.glp.qe.utility.InitClass;
import com.pearson.glp.qe.utility.PropertyManager;
import com.pearson.glp.qe.utility.ReadConfigXlsFiles;
import com.pearson.glp.qe.utility.Utility;

import io.restassured.specification.RequestSpecification;

public class SerenityBase {
    static Properties configProperties;
    static RequestSpecification request;
    protected static String projectPath;
    protected static String platform;
    protected static Logger APP_LOG = null;
    protected static Map<String, String> configurationsXlsMap = new HashMap<>();
    protected static String executionEnviroment;
    protected static String contentType;
    public static String reportStartTime;
    private static String serenityReportFile;
    public static Properties queries = new Properties();
    static {
        init();
        reportStartTime = InitClass.now("dd.MMMMM.yyyy_hh.mm.ss");
        readQueryPropertiesFile();
    }

    /**
     * Initialize config.property available under resource folder
     * 
     */
    private static synchronized void init() {
        try {
            if (projectPath == null || "".equals(projectPath)) {
                // As java
                projectPath = PropertyManager.getInstance()
                        .getValueForKey("ProjectPath").trim();
                executionEnviroment = PropertyManager.getInstance()
                        .valueFromConfig("Execution_environment").trim();
            }

            if (null != APP_LOG) {
            } else {
                APP_LOG = InitClass.initializeLogger(projectPath);
                PropertyConfigurator.configure(System.getProperty("user.dir")
                        + "/src/test/resources/configFiles/propertiesFile/log4j.properties");
            }

            if (configurationsXlsMap.isEmpty()) {
                readEnvironmentConfigurationFile();
            }

            Utility.putVariablesInMap(APIEndPoints.class);
            Utility.putVariablesInMap(JsonPath.class);
            // Utility.putVariablesInMap(Constants.class);
        } catch (Exception e) {

            if (APP_LOG == null) {
                APP_LOG = InitClass.initializeLogger(projectPath);
                PropertyConfigurator.configure(System.getProperty("user.dir")
                        + "/src/test/resources/configFiles/propertiesFile/log4j.properties");
                APP_LOG.error(
                        "Error during reading of config.property file, this is expected if user is "
                                + "running it from testng.xml and passing params from xml it self",
                        e);
            }
        }
    }

    public static synchronized void readEnvironmentConfigurationFile() {
        APP_LOG.debug("Reading Environment configuration file");
        ReadConfigXlsFiles objConfigXlsFiles = new ReadConfigXlsFiles();
        configurationsXlsMap = objConfigXlsFiles.readConfigurationsXls(
                projectPath, executionEnviroment.trim(), APP_LOG);
    }

    public static synchronized void readQueryPropertiesFile() {
        APP_LOG.debug("Reading Query from configuration file");
        InputStream stream = Thread.currentThread().getContextClassLoader()
                .getResourceAsStream(
                        "configFiles/propertiesFile/queries.properties");

        try {
            queries.load(stream);

        } catch (IOException e) {
            APP_LOG.error("Error on reading queries config file");
        }
    }

}
