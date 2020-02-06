/*
 * PEARSON PROPRIETARY AND CONFIDENTIAL INFORMATION SUBJECT TO NDA 
 * Copyright (c) 2017 Pearson Education, Inc.
 * All Rights Reserved. 
 * 
 * NOTICE: All information contained herein is, and remains the property of 
 * Pearson Education, Inc. The intellectual and technical concepts contained 
 * herein are proprietary to Pearson Education, Inc. and may be covered by U.S. 
 * and Foreign Patents, patent applications, and are protected by trade secret 
 * or copyright law. Dissemination of this information, reproduction of this  
 * material, and copying or distribution of this software is strictly forbidden   
 * unless prior written permission is obtained from Pearson Education, Inc.
 */
package com.pearson.glp.qe.utility;

/**
 * @author
 */
public abstract class Constants {

    public static final String TEST_CASES_SHEET = "Test Cases";
    public static final String TEST_STEPS = "Test Steps";
    public static final String COL_HEAD_RUNMODE = "Runmode";
    public static final String COL_HEAD_DESCRIPTION = "TestCaseDescription";
    public static final String COL_HEAD_STEP_DESCRIPTION = "TestStepDescription";
    public static final String COL_HEAD_KEYWORD = "Keyword";
    public static final String COL_HEAD_KEYWORD_IOS = "KeywordIOS";
    public static final String COL_HEAD_ELEMENT_ID = "ElementId";
    public static final String COL_HEAD_DATA = "Data";
    public static final String COL_HEAD_INDEX_POS = "IndexPosition";

    public static final String COL_HEAD_DATA_DRIVEN = "DataDriven";
    public static final String COL_DYNAMIC_XPATH = "DynamicXpathValue";
    public static final String COL_HEAD_GO_TO = "JumpTo";
    public static final String COL_HEAD_EXECUTION_STATUS = "ExecutionStatus";
    public static final String EXE_RUNNING = "Running";
    public static final String EXE_HANG = "Hang";
    public static final String SUIT_FILE_NAME = "suits.xlsx";

    public static final String SUIT_FILE_NAME_HTMLBROWSERREPORT = "htmlXlsReport";
    public static final String SUIT_FILE_SHEET = "Sheet1";
    public static final String SUIT_FILE_SHEET_TWO = "Sheet2";
    public static final String COL_HEAD_PASS = "Pass";
    public static final String COL_HEAD_FAIL = "Fail";
    public static final String COL_HEAD_SKIP = "Skipped";
    public static final String COL_HEAD_TOTAL_EXECUTED_TC = "Total Executed Test Cases";

    public static final String COL_HEAD_STATUS = "Status";
    public static final String COL_HEAD_EndTime = "End Time";
    public static final String COL_HEAD_Fail_TotalCount = "Fail/TotalCount";
    public static final String COL_HEAD_StartTime = "Start Time";
    public static final String COL_HEAD_TCID = "TCID";
    public static final String COL_HEAD_TSID = "TSID";
    public static final String COL_HEAD_RESULT = "Result";
    public static final String COL_HEAD_TestScript = "TestScript#";
    public static final String COL_HEAD_CURRENT_SUITE_NAME = "Current_SuiteName";

    public static final String COL_HEAD_IDE_FILE_NAME = "IdeFileName";
    public static final String COL_HEAD_CREATE_NEW_SUIT = "CreateNewSuit";
    public static final String COL_HEAD_CREATE_NEW_TEST_CASE = "CreateNewTestCase";
    public static final String COL_HEAD_APPEND_IN_TEST_CASE = "AppendInTestCase";

    public static final String IDE_FILE_NAME = "configIde.xlsx";

    public static final String COL_VARIABLE_NAME = "Variable Name";
    public static final String COL_ID = "id";
    public static final String COL_NAME = "name";
    public static final String COL_CSS = "css";
    public static final String COL_XPATH = "xpath";

    public static final String PASS = "PASS";
    public static final String FAIL = "FAIL";
    public static final String SKIP = "SKIP";

    public static final String PREFIX_DATA_SHEET = "DS";
    public static final String PREFIX_DATA_CONFIG = "CON";
    public static final String PREFIX_DATA_OR = "OR";

    
    public static final String EXPECTED_RESULT = "ER";
    public static final String SPLIT_PARAMETER = "|";
    protected static final String elementPrefixList[] = { "css", "id", "//",
            "name", "link", "partiallinktext", "tagName", "class" };

    public static final String COL_DATA_DRIVEN = "DataDriven";
    public static final String DATA_SHEET = "Data Sheet";
    public static final String COL_HEAD_TCDI = "TCDI";

    public static final String PREFIX_TEST_STEP = "TS-";
    public static final String PREFIX_TEST_CASE = "TC-";

}
