/******************************************************************************
 *
 *      VersionOneIntegration.java
 *
 *      Capgemini Confidential
 *      CG Source Materials
 *      � Copyright Capgemini 2017
 *
 *
 *******************************************************************************
 *
 *   Date....	WHO 	Description...............................................
 *	21/03/17	NR		First Created
 *  	
 ******************************************************************************/

package com.cg.bdd.main;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.cg.bdd.common.Common_Runtime;

import com.google.gson.JsonObject;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

import com.versionone.apiclient.Asset;
import com.versionone.apiclient.Query;
import com.versionone.apiclient.Services;

import com.versionone.apiclient.V1Connector;
import com.versionone.apiclient.exceptions.APIException;
import com.versionone.apiclient.exceptions.ConnectionException;
import com.versionone.apiclient.exceptions.OidException;
import com.versionone.apiclient.exceptions.V1Exception;
import com.versionone.apiclient.interfaces.IAssetType;
import com.versionone.apiclient.interfaces.IAttributeDefinition;
import com.versionone.apiclient.interfaces.IServices;
import com.versionone.apiclient.services.QueryResult;



/**
 * @author naboggar
 */

public class VersionOneIntegration extends Common_Runtime {
	
	public static Connection conn = null;
	public static PreparedStatement stmt = null;
	public static String mysqlQuery = null;

	// VersionOne Details
	public static V1Connector v1Connector = null;
	public static URI uri = null;
	public static  String host = "";
	public static  String username = "";
	public static  String password = "";
	public static  String projectRef = "";
	public static  String apikey = "";

	public static String applicationName = "bdd2.0";

	// JsonObjects to be created
	public static JsonObject releaseJsonObject;
	public static JsonObject iterationJsonObject;
	public static JsonObject storyJsonObject;
	
	public Common_Runtime cmrt=null;
	/**
	 * Default constructor
	 * 
	 */

	public VersionOneIntegration(String toolName) {
		try {
			populateConnectionStringVariables(toolName);
		} catch (ClassNotFoundException | SQLException e) {

			e.printStackTrace();
		}
	}
	
	/**
	 * Description: This method is used to populate the VersionOne connection string variables from the database
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public void populateConnectionStringVariables(String toolName) throws ClassNotFoundException, SQLException
	{	
		cmrt=new Common_Runtime();
		cmrt.connectToDatabase();
		String query = "SELECT * from almtool where ToolName=\'" + toolName + "\';";
		ResultSet rs = cmrt.executeQuery(query);
		rs.beforeFirst();
		if (rs.next())
		{
			host = rs.getString("ToolURL");
			apikey = rs.getString("APIKey");
			username = rs.getString("ToolUserName");
			password = rs.getString("ToolPassword");
			projectRef = rs.getString("ProjectReference");
		}
		rs.close();
	}


	
	
	/**
	 * Description: This method is used for refreshing the Data
	 * 
	 * @throws URISyntaxException
	 * @throws IOException
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public void refreshData() throws URISyntaxException, IOException, ClassNotFoundException, SQLException {
		connectToVersionOne();
		System.out.println("Before calling Fetch release details :"+v1Connector.toString());
		try {
			fetchReleaseDetails();
		} catch (ConnectionException | APIException | OidException e) {
			
			e.printStackTrace();
		}
		disconnectVersionOne();
	}

	/**
	 * Description: This method is used to establish a connection to VersionOne
	 * 
	 * @throws URISyntaxException
	 * @throws IOException
	 */
	public void connectToVersionOne() throws URISyntaxException, IOException {

		try {
			v1Connector = V1Connector.withInstanceUrl("https://www52.v1host.com/CapgeminiIndiapvtltd").withUserAgentHeader("bdd2.0", "1.0").withAccessToken("1.1zPJfQgMLlXKh0ED3RJh0bd0bVg=").build();
			//connector = V1Connector.withInstanceUrl("https://www52.v1host.com/CapgeminiIndiapvtltd").withUserAgentHeader("bdd2.0", "1.0").withAccessToken("1.1zPJfQgMLlXKh0ED3RJh0bd0bVg=").build();
			//v1Connector = V1Connector.withInstanceUrl(host).withUserAgentHeader(applicationName, "1.0").withAccessToken(apikey).build();
			System.out.println("VersionOne: "+v1Connector.toString());
		//1.1zPJfQgMLlXKh0ED3RJh0bd0bVg=
							
				} catch (OidException e) {
					e.printStackTrace();
				}
		catch (V1Exception e1) {
			e1.printStackTrace();
		}
	
	}

	/**
	 * Description: This method is used to disconnect a connection to VersionOne
	 */
	public void disconnectVersionOne() {
		v1Connector=null;
		cmrt.disconnectDatabase();
	}

	/**
	 * Description: This method is used to format the date to be able to insert
	 * into MySQL
	 * 
	 * @param myDate
	 * @return
	 */
	public String formatDateTime(String myDate) {
		myDate = myDate.replace("Z", "000");
		myDate = myDate.replace("T", " ");
		return myDate;
	}

	/**
	 * Description: This method is used to fetch the Release level details from
	 * VersionOne and store into the mysql database. If the record is already
	 * existing, the update of the record is done.
	 * 
	 * @throws IOException
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 * @throws OidException 
	 * @throws APIException 
	 * @throws ConnectionException 
	 */
	public void fetchReleaseDetails() throws IOException,
			ClassNotFoundException, SQLException, ConnectionException, APIException, OidException {
		System.out.println("In FetchReleaseDetails");
		//Fetch Project Details
		IServices services = new Services(v1Connector);
		IAssetType projectType = services.getMeta().getAssetType("Scope");
		Query query= new Query(projectType);
		IAttributeDefinition nameAttribute = projectType.getAttributeDefinition("Name");
		query.getSelection().add(nameAttribute);
		QueryResult result = services.retrieve(query);
		System.out.println("Project Details :");
		for (Asset project : result.getAssets()) {
			System.out.println("----------------------------------");
		    System.out.println("Project ID: "+project.getOid().getToken());
		    System.out.println("Project Name: "+project.getAttribute(nameAttribute).getValue());
		    System.out.println("----------------------------------");
		}
		query=null;
		services=null;

	}

	/**
	 * Description: This method is used to fetch the Iteration details using the
	 * release ID, release start and end dates. After fetching the iteration
	 * details, they are stored in the mysql database. If the record is
	 * existing, it will be updated.
	 * 
	 * @param releaseID
	 * @param releaseStartDate
	 * @param releaseEndDate
	 * @throws IOException
	 */
	public void fetchIterationDetails(int releaseID, String releaseStartDate,
			String releaseEndDate) throws IOException {

	}

	/**
	 * Description: This method is used to fetch the UserStory details based on
	 * the Iteration ID and Name. After fetching the User story details, they
	 * are stored in the mysql database. If the record already exists, it will
	 * be updated.
	 * 
	 * @param iterationID
	 *            : The Iteration ID whose user stories are pulled from the tool
	 * @param iterationName
	 *            : The Iteration Name corresponding to the iteration ID
	 * @throws IOException
	 */
	public void fetchUserStory(int iterationID, String iterationName)
			throws IOException {
		
	}

	/**
	 * Description: This method will separate all the scenarios from the User
	 * Story Description and insert/update to the database table
	 * 
	 * @param userStoryDescription
	 *            - The user story description along with scenarios
	 * @param userStoryID
	 *            - The user story id for which scenarios are separated from
	 */
	public void fetchScenarios(String userStoryDescription, String userStoryID) {


	}

	/**
	 * Description: This method is used to retrieve the user story description
	 * by separating it from the scenarios.
	 * 
	 * @param userStoryDescription
	 *            : The user story description inclusive of scenarios.
	 * @return String: The separated user story description
	 */
	public String getUserStoryDescription(String userStoryDescription) {
		int ind = userStoryDescription.indexOf("Scenario:");
		String userStory = userStoryDescription.substring(0, ind - 1);
		return userStory;
	}

	/**
	 * Description: This method will split the scenarios from the user story
	 * description
	 * 
	 * @param userStoryDescription
	 *            : The user story description which has the scenarios appended
	 *            to it.
	 * @return The string array of the scenarios.
	 */
	public String[] getScenario(String userStoryDescription) {
		String tempUserStoryDescription = userStoryDescription;
		int ind = userStoryDescription.indexOf("Scenario:");
		int count = getNoOfOccurrences(userStoryDescription, "Scenario:");
		String[] scenario = new String[count];
		int cnt = 0;
		while (ind != -1) {
			cnt++;
			tempUserStoryDescription = tempUserStoryDescription
					.substring(ind + 9);
			ind = tempUserStoryDescription.indexOf("Scenario:");
			if (ind < 0) {
				scenario[cnt - 1] = tempUserStoryDescription;
			} else {
				scenario[cnt - 1] = tempUserStoryDescription.substring(0,
						ind - 1);
				tempUserStoryDescription = tempUserStoryDescription
						.substring(ind);
			}

		}
		return scenario;
	}
}