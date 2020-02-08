/******************************************************************************
 *
 *      TblDAO.java
 *
 *      Capgemini Confidential
 *      CG Source Materials
 *      © Copyright Capgemini 2017
 *
 *
 *******************************************************************************
 *
 *   Date....	WHO 	Description...............................................
 *	19/02/17	NR		First Created to combine all the Tbl methods into one single class.
 *  13/04/17 	NR		Modified the class to add the scenarios along with userstory description
 *	
 ******************************************************************************/

package com.cg.bdd.main;

import java.io.IOException;
import java.io.InputStream;
import java.io.StringWriter;
import java.io.Writer;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.swing.JEditorPane;
import javax.swing.text.BadLocationException;
import javax.swing.text.EditorKit;

import com.cg.bdd.common.Common_Runtime;

public class TblDAO {

	public TblDAO() {
		super();
	}

	StringBuffer sbf1 = new StringBuffer();

	/**
	 * This method is used to find the User story details based on the release,
	 * iteration and userstory and return a string with all the userstory
	 * description.
	 * 
	 * @param releaseName
	 * @param iterationName
	 * @param userstoryName
	 * @return
	 */
	public String findByDemandStory(String toolNickName, String releaseName, String iterationName,
			String userstoryName) {

			SubFolderSearch sfs = new SubFolderSearch();
			Common_Runtime cmrt = new Common_Runtime();
			ResultSet rs = null;
			try {
				System.out.println("demand details calls in");
				cmrt.connectToDatabase();
				String query = null;
				// srs query1 =
				// "SELECT * FROM test.release where R_name=? and I_name=? and F_name=?";
				// query1 =
				// "SELECT * FROM test.release where R_name=? and I_name=? and D_name=?";
				// query1="Select * from mysqlbdd.userstory where UserStoryName = \""
				// + feature+
				// "\" and IterationID = (Select IterationID from mysqlbdd.iteration where IterationName= \""
				// + iteration +
				// "\" and ReleaseID = (Select ReleaseID from mysqlbdd.release where ReleaseName = \""+release+"\")));";
				if (toolNickName !=null)
				{
					if (releaseName !=null)
					{
						if (iterationName !=null)
						{
							if (userstoryName != null)
								query = "select * from userstory where UserStoryName = \""+userstoryName + "\" and IterationID in (select IterationID from iteration where IterationName = \""+iterationName+"\"  and ReleaseID in (Select ReleaseID from bddrelease where ReleaseName = \""+releaseName+"\" and ToolID = (select ToolID from almtool where ToolNickName = \""+toolNickName+"\")));";
							else
								query= "select * from userstory where IterationID in (select IterationID from iteration where IterationName = \""+iterationName+"\"  and ReleaseID in (Select ReleaseID from bddrelease where ReleaseName = \""+releaseName+"\" and ToolID = (select ToolID from almtool where ToolNickName = \""+toolNickName+"\")));";
						}
						else
							query = "select * from userstory where IterationID in (select IterationID from iteration where ReleaseID in (Select ReleaseID from bddrelease where ReleaseName = \""+releaseName+"\" and ToolID = (select ToolID from almtool where ToolNickName = \""+toolNickName+"\")));";
					}
					else
						query="select * from userstory where IterationID in (select IterationID from iteration where ReleaseID in (Select ReleaseID from bddrelease where ToolID = (select ToolID from almtool where ToolNickName = \""+toolNickName+"\")));";
				}
				
				System.out.println(query);
				rs = cmrt.executeQuery(query);
				Integer i = 0;
				String flag = null;
				while (rs.next()) {
					boolean result = sfs.folderFileexist(
							rs.getString("UserStoryName").toString(), userstoryName,
							rs.getString("UserStoryID").toString());
					System.out.println("folder status is" + result);
					if (result == false) {
						flag = "No";
					} else {
						flag = "Yes";
					}
					if (i > 0) {
						sbf1.append("~");
					}
					sbf1.append(rs.getString("UserStoryID") + ":"
							+ rs.getString("UserStoryName") + ":" + flag + ":"
							+ rs.getString("UserStoryDescription"));
					i++;
				}
				rs.close();
				cmrt.disconnectDatabase();
			} catch (SQLException se) {
				// Handle errors for JDBC
				se.printStackTrace();
			} catch (Exception e) {
				// Handle errors for Class.forName
				e.printStackTrace();
			}
		return sbf1.toString();
	}

	/**
	 * This method is used to pull the user story details based on the selected
	 * release or iteration or user story
	 * 
	 * @param field
	 * @param param
	 * @return
	 */
	public String findByDemandStoryDetails(String field, String param) {
		Common_Runtime cmrt = new Common_Runtime();
		List<String> scenes = null;	
		ResultSet rs = null;
		try {
			System.out.println("demand details calls in");
			cmrt.connectToDatabase();
			String query1 = null;
			query1 = "SELECT * FROM mysqlbdd.userstory where UserStoryName=?";
			System.out.println(query1);
			rs = cmrt.executeQuery(query1, field);
			Integer i = 0;
			while (rs.next()) {
				scenes = cmrt.getScenarios(rs.getString("userStoryID").toString());
				sbf1.append(rs.getString("UserStoryDescription").toString()+"\n");
				for (int j=0; j<scenes.size(); j++)
					sbf1.append(scenes.get(j)+"\n");
				//sbf1.append("~");
				System.out.println(rs.getString("UserStoryDescription"));
				System.out.println(i);
				i++;
				//rs.afterLast();
			}
			rs.close();
			cmrt.disconnectDatabase();
		} catch (SQLException se) {
			// Handle errors for JDBC
			se.printStackTrace();
		} catch (Exception e) {
			// Handle errors for Class.forName
			e.printStackTrace();
		}

		return sbf1.toString();
	}
	

	/**
	 * This method converts and returns a given InputStream to string
	 * 
	 * @param inStream
	 * @return
	 */
	public String converttext(InputStream inStream) {

		// read rtf from file
		JEditorPane p = new JEditorPane();
		p.setContentType("text/rtf");
		EditorKit rtfKit = p.getEditorKitForContentType("text/rtf");
		try {
			rtfKit.read(inStream, p.getDocument(), 0);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (BadLocationException e) {
			e.printStackTrace();
		}
		rtfKit = null;

		// convert to text
		EditorKit txtKit = p.getEditorKitForContentType("text/plain");
		Writer writer = new StringWriter();
		try {
			txtKit.write(writer, p.getDocument(), 0, p.getDocument()
					.getLength());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (BadLocationException e) {
			e.printStackTrace();
		}
		String documentText = writer.toString();
		System.out.println("this is converted text = " + documentText);
		return documentText;
	}

	/**
	 * This method is used to find the user stories based on the feature name,
	 * release or iteration
	 * 
	 * @param str
	 * @param param
	 * @return
	 * @throws SQLException
	 */
	public String findByFeatures(String str, String param) throws SQLException {

		Common_Runtime cr = null;
		String query1 = null;
		ResultSet rs = null;
		try {

			cr = new Common_Runtime();
			cr.connectToDatabase();
			//Commented by Rani.
			/*System.out.println("Selected Query:");
			if (param.equals("release")) {
				query1 = "SELECT DISTINCT D_name FROM test.release where R_name=?";
				query1 = "SELECT DISTINCT UserStoryName from mysqlbdd.userstory where IterationID=(select IterationID from iteration where ReleaseID=(select ReleaseID from bddrelease where ReleaseName = ?))";
			}
			// rs = cr.executeQuery(query1, str);
			if (param.equals("iteration")) {
				query1 = "SELECT DISTINCT D_name FROM test.release where I_name=?";
				query1 = "SELECT DISTINCT UserStoryName from mysqlbdd.userstory where IterationID=(select IterationID from iteration where IterationName = ?)";
				rs = cr.executeQuery(query1, str);
			}
			//
			if (param.equals("feature"))
			// srs {query1 =
			// "SELECT DISTINCT F_name FROM test.release where F_name=?";}
			{
				query1 = "SELECT DISTINCT D_name FROM test.release where F_name=?";
				query1 = "SELECT DISTRINCT UserStoryName from mysqlbdd.userstory where UserStoryName=?";
				rs = cr.executeQuery(query1, str);
			}
			if (param.equals("demand"))
			// srs {query1 =
			// "SELECT DISTINCT F_name FROM test.release where D_name=?";}
			{
				query1 = "SELECT DISTINCT D_name FROM test.release where D_name=?";
				query1 = "SELECT DISTRINCT UserStoryName from mysqlbdd.userstory where UserStoryName=?";
			}
			System.out.println(query1);*/
			rs = cr.executeQuery(query1, str);
			Integer i = 0;
			while (rs.next()) {
				// srs sbf1.append(rs.getString("F_name")+"~");
				// srs System.out.println(rs.getString("F_name"));
				sbf1.append(rs.getString("UserStoryName") + "~");

				i++;

			}
			rs.close();
			cr.disconnectDatabase();
		} catch (SQLException se) {
			// Handle errors for JDBC
			se.printStackTrace();
		} catch (Exception e) {
			// Handle errors for Class.forName
			e.printStackTrace();
		}

		return sbf1.toString();
	}

	/**
	 * This method is used to find the list of iterations for the selected
	 * release
	 * 
	 * @param str
	 * @param param
	 * @return
	 * @throws SQLException
	 */
	public String findByIteration(String str, String param) throws SQLException {
		Common_Runtime cr = null;
		String query1 = null;
		try {

			cr = new Common_Runtime();
			cr.connectToDatabase();
			//Commented by Rani.
		/*if (param.equals("release")) {
			query1 = "SELECT DISTINCT UserStoryName from mysqlbdd.userstory where IterationID = (SELECT IterationID from mysqlbdd.Iteration where IterationName = ?);";
		}
		if (param.equals("iteration")) {
			query1 = "SELECT DISTINCT UserStoryName from mysqlbdd.userstory where IterationID = (SELECT IterationID from mysqlbdd.Iteration where IterationName = ?);";
		}
		// Commented by Rani
		if (param.equals("feature")) {
			query1 = "SELECT DISTINCT I_name FROM test.release where F_name=?";
			query1 = "SELECT DISTINCT IterationName from mysqlbdd.Iteration where IterationID =  (select IterationID from mysqlbdd.userstory where UserStoryName=?)";
		}
		if (param.equals("demand")) {
			query1 = "SELECT DISTINCT  I_name FROM test.release where D_name=?";
			query1 = "SELECT DISTINCT IterationName from mysqlbdd.Iteration where IterationID =  (select IterationID from mysqlbdd.userstory where UserStoryName=?)";
		}*/
			query1 = "SELECT DISTINCT UserStoryName from mysqlbdd.userstory where IterationID = (SELECT IterationID from mysqlbdd.Iteration where IterationName = ?);";
			System.out.println("Selected Query:");
			System.out.println(query1);
			ResultSet rs = cr.executeQuery(query1, str);
			Integer i = 0;
			while (rs.next()) {
				sbf1.append(rs.getString("UserStoryName") + "~");
				System.out.println(rs.getString("UserStoryName"));
				i++;

			}
			rs.close();
			cr.disconnectDatabase();
		} catch (SQLException se) {
			// Handle errors for JDBC
			se.printStackTrace();
		} catch (Exception e) {
			// Handle errors for Class.forName
			e.printStackTrace();
		}

		return sbf1.toString();

	}

	/**
	 * This method is used to find the list of Releases for the selected
	 * almtool
	 * 
	 * @param str
	 * @param param
	 * @param strToolName TODO
	 * @return
	 * @throws SQLException
	 */
	public String findByRelease(String str, String param, String strToolName) throws SQLException {
		Common_Runtime cr = null;
		String query = null;
		ResultSet rs =  null;
		try {
			cr = new Common_Runtime();
			cr.connectToDatabase();
		//commented by Rani.
		/*if (param.equals("release")) {
			
			query1 = "SELECT DISTINCT IterationName from mysqlbdd.iteration where ReleaseID = (SELECT ReleaseID from mysqlbdd.bddrelease where ReleaseName = ?);";
		}
		if (param.equals("iteration")) {
			query1 = "SELECT DISTINCT IterationName from mysqlbdd.iteration where ReleaseID = (SELECT ReleaseID from mysqlbdd.bddrelease where ToolID = (Select ToolID from almtool where ToolID = ?)";
		}
		// Commented by Rani
		if (param.equals("feature")) {
			query1 = "SELECT DISTINCT I_name FROM test.release where F_name=?";
			query1 = "SELECT DISTINCT IterationName from mysqlbdd.Iteration where IterationID =  (select IterationID from mysqlbdd.userstory where UserStoryName=?)";
		}
		if (param.equals("demand")) {
			query1 = "SELECT DISTINCT  I_name FROM test.release where D_name=?";
			query1 = "SELECT DISTINCT IterationName from mysqlbdd.Iteration where IterationID =  (select IterationID from mysqlbdd.userstory where UserStoryName=?)";
		}
*/			switch(param)
			{
				case "iteration": 
				{
					if (str.equalsIgnoreCase("All"))
					{
						query = "select IterationName from iteration where ReleaseID in (Select ReleaseID from bddrelease where ReleaseName = ?);";
					}
					else
					{
						query = "select IterationName from iteration where ReleaseID in (Select ReleaseID from bddrelease where ToolID = (select ToolID from almtool where ToolNickName = ?);";
						str=strToolName;
					}
					System.out.println("Select Query is :" + query);
					rs = cr.executeQuery(query, str);
					Integer i = 0;
					while (rs.next()) {
						sbf1.append(rs.getString("IterationName") + "~");
						System.out.println(rs.getString("IterationName"));
						i++;
					}
					break;
				}
				case "feature": 
				{
					query = "select UserStoryID, UserStoryName from userstory where IterationID in (select IterationID from iteration where ReleaseID in (Select ReleaseID from bddrelease where ReleaseName = ?));";
					System.out.println("Select Query is :" + query);
					rs = cr.executeQuery(query, str);
					Integer i = 0;
					while (rs.next()) {
						sbf1.append(rs.getString("UserStoryName") + "~");
						System.out.println(rs.getString("UserStoryName"));
						i++;
					}
					break;
				}
			}
			rs.close();
			cr.disconnectDatabase();
		} catch (SQLException se) {
			// Handle errors for JDBC
			se.printStackTrace();
		} catch (Exception e) {
			// Handle errors for Class.forName
			e.printStackTrace();
		}

		return sbf1.toString();

	}
	/**
	 * This method is used to find the list of all releases, iterations and user
	 * stories
	 * 
	 * @param Fieldname
	 * @param param
	 * @return
	 * @throws SQLException
	 */
	public String AnyData(String Fieldname, String param) throws SQLException {
		Common_Runtime cr = new Common_Runtime();
		ResultSet rs = null;
		String query = null;
		if (param.equals("release")) {
			query = "SELECT DISTINCT R_name FROM test.release where R_name=?";
			query = "SELECT DISTINCT ReleaseName from mysqlbdd.bddrelease where ReleaseName=?";
		}
		if (param.equals("iteration")) {
			query = "SELECT DISTINCT R_name FROM test.release where I_name=?";
			query = "SELECT DISTINCT ReleaseName from mysqlbdd.bddrelease where ReleaseID = (Select ReleaseID from mysqlbdd.iteration where IterationName = ?)";
		}
		// Commented by Rani
		if (param.equals("feature")) {
			query = "SELECT DISTINCT R_name FROM test.release where F_name=?";
			query = "SELECT DISTINCT ReleaseName from mysqlbdd.bddrelease where ReleaseID = (Select ReleaseID from mysqlbdd.iteration where IterationID=(Select IterationID from userstory where UserStoryName = ?))";
		}
		if (param.equals("demand")) {
			query = "SELECT DISTINCT R_name FROM test.release where D_name=?";
			query = "SELECT DISTINCT ReleaseName from mysqlbdd.bddrelease where ReleaseID = (Select ReleaseID from mysqlbdd.iteration where IterationID=(Select IterationID from userstory where UserStoryName = ?))";
		}
		try {
			// STEP 2: Register JDBC driver
			cr.connectToDatabase();
			System.out.println("Selected Query:");
			System.out.println(query);
			rs = cr.executeQuery(query, Fieldname);
			Integer i = 0;
			while (rs.next()) {
				// Data.put("name"+i, rs.getString(FieldNameFinal));
				sbf1.append(rs.getString("ReleaseName") + "~");
				System.out.println(rs.getString("ReleaseName"));
				i++;

			}
			// st = rs.next();
			rs.close();
			// stmt.close();
			cr.disconnectDatabase();
		} catch (SQLException se) {
			// Handle errors for JDBC
			se.printStackTrace();
		} catch (Exception e) {
			// Handle errors for Class.forName
			e.printStackTrace();
		}
		return sbf1.toString();

	}

	/**
	 * This method is used to find the list of all the ALM Tools registered
	 * in the database and send it as a ~ separated string
	 * @param param
	 * @param releaseName TODO
	 * @param iterationName TODO
	 * @param toolName
	 * 
	 * @return
	 * @throws SQLException
	 */
	public String findByTool(String toolNickName, String param, String releaseName, String iterationName) throws SQLException {
		Common_Runtime cr = null;
		String query = null;
		String str=null;
		ResultSet rs = null;
		try {
			cr = new Common_Runtime();
			cr.connectToDatabase();
			
			switch(param){
				case "release":
				{
					query = "select ReleaseName from bddrelease where ToolID =(select ToolID from almtool where ToolNickName = ?) ";
					System.out.println("Select Query is :" + query);
					rs = cr.executeQuery(query, toolNickName);
					Integer i = 0;
					while (rs.next()) {
						sbf1.append(rs.getString("ReleaseName") + "~");
						System.out.println(rs.getString("ReleaseName"));
						i++;
					}
					break;
				}
				case "iteration": 
				{
					//and ReleaseName =" + releaseName +"
					
					if (releaseName!=null)
					{
						query = "select IterationName from iteration where ReleaseID in (Select ReleaseID from bddrelease where ReleaseName = ? );";
						str=releaseName;
					}
					else
					{
						query = "select IterationName from iteration where ReleaseID in (Select ReleaseID from bddrelease where ToolID = (select ToolID from almtool where ToolNickName = ?) );";
						str=toolNickName;
					}
					System.out.println("Select Query is :" + query);
					rs = cr.executeQuery(query, str);
					Integer i = 0;
					while (rs.next()) {
						sbf1.append(rs.getString("IterationName") + "~");
						System.out.println(rs.getString("IterationName"));
						i++;
					}
					break;
				}
				case "feature": 
				{
					//and "+ iterationName +"
					
					if (releaseName!=null)
					{
						query = "select UserStoryName from userstory where IterationID in (select IterationID from iteration where ReleaseID in (Select ReleaseID from bddrelease where ReleaseName = ? ));";
						str=releaseName;
					}
					else if (iterationName!=null)
					{
						query = "select UserStoryName from userstory where IterationID in (select IterationID from iteration where IterationName = ? );";
						str=iterationName;
					}
					else
					{
						query = "select UserStoryName from userstory where IterationID in (select IterationID from iteration where ReleaseID in (Select ReleaseID from bddrelease where ToolID = (select ToolID from almtool where ToolNickName = ?)) );";
						str=toolNickName;
					}
					//query = "select UserStoryName from userstory where IterationID in (select IterationID from iteration where ReleaseID in (Select ReleaseID from bddrelease where ToolID = (select ToolID from almtool where ToolNickName = ?)) );";
					System.out.println("Select Query is :" + query);
					rs = cr.executeQuery(query, str);
					Integer i = 0;
					while (rs.next()) {
						sbf1.append(rs.getString("UserStoryName") + "~");
						System.out.println(rs.getString("UserStoryName"));
						i++;
					}
					break;
				}
			}
			rs.close();
			cr.disconnectDatabase();
		} catch (SQLException se) {
			// Handle errors for JDBC
			se.printStackTrace();
		} catch (Exception e) {
			// Handle errors for Class.forName
			e.printStackTrace();
		}
		return sbf1.toString();
	}
	
	public String listPendingApprovals(String toolNickName)
	{
		Common_Runtime cmrt = new Common_Runtime();
		ResultSet rs = null;
		String query=null;
		try {
			cmrt.connectToDatabase();
			query = "Select UserStoryName from userstory where UserStoryID in (Select UserStoryID from pendingapprovals where ToolNickName = ?) ";
			rs = cmrt.executeQuery(query, toolNickName);
			while (rs.next()) {
				sbf1.append(rs.getString("UserStoryName") + "~");
				System.out.println(rs.getString("UserStoryName"));
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sbf1.toString();
	}

	public String getNewStoryDescription(String userStoryName) {
		Common_Runtime cmrt = new Common_Runtime();
		ResultSet rs = null;
		String query=null;
		try {
			cmrt.connectToDatabase();
			query = "Select NewStoryDescription from pendingapprovals where UserStoryID in (select UserStoryID from userstory where UserStoryName = ?) ";
			rs = cmrt.executeQuery(query, userStoryName);
			while (rs.next()) {
				sbf1.append(rs.getString("NewStoryDescription"));
				System.out.println(rs.getString("NewStoryDescription"));
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sbf1.toString();
	}
	
}
