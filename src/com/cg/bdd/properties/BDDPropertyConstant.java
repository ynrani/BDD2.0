/******************************************************************************
 *
 *      BDDPropertyConstant.java
 *
 *      Capgemini Confidential
 *      CG Source Materials
 *      © Copyright Capgemini 2017
 *
 *
 *******************************************************************************
 *
 *   Date....	WHO 	Description.........................................
 *	09/02/17	NR		First Created
 *
 ******************************************************************************/

package com.cg.bdd.properties;

public class BDDPropertyConstant {

	// Added for jdbc
	public static final String jdbc_driver = "db.JDBCDriver";
	public static final String jdbc_dbUser = "db.USER";
	public static final String jdbc_dbPass = "db.PASSWORD";
	public static final String jdbc_dbHost = "db.HOST";
	public static final String jdbc_dbPort = "db.PORT";
	public static final String jdbc_dbName = "db.NAME";

	public static final String rally_user = "rally.USERNAME";
	public static final String rally_password = "rally.PASSWORD";
	public static final String rally_url = "rally.URL";

	public static String resourcesLocale;
	
	
	public static final String INVALID_USER_NAME_OR_PASSWORD_KEY = "error";
	public static final String INVALID_USER_NAME_OR_PASSWORD_VALUE = "Invalid Username or Password";
	
	public static final String LOGIN_PAGE_NAME = "FinalLanding1.jsp";
	
	
	
	public static final String USER_IS_NOT_LOGGED_IN_KEY = "userIsNotLoggedIn";
	public static final String USER_IS_NOT_LOGGED_IN_VALUE = "User is not logged in.Please log in";
	
	
	public static final String USER_IS_ALREADY_LOGGED_IN_KEY = "alreadyLogged_message_key";
	public static final String USER_IS_ALREADY_LOGGED_IN_VALUE = "User Already Logged In";
	
	
	public static final String USER_IS_LOGGED_OUT_KEY = "successfully_logged_out_message_key";
	public static final String USER_IS_LOGGED_OUT_VALUE = "Logout Successfully";
	
	public static final String[] FILTER_ARRAY = {"/Main_admin.jsp","/CreateFileNewUI.jsp","/OpenFile.jsp","/Configure.jsp","/Run.jsp"};
	
	
	
	
	
	public static final String USER_NAME = "uname";
}
