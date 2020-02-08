/******************************************************************************
 *
 *      EditFeatureFileServlet.java
 *
 *      Capgemini Confidential
 *      CG Source Materials
 *      © Copyright Capgemini 2017
 *
 *
 *******************************************************************************
 *
 *   Date....	WHO 	Description...............................................
 *	09/02/17	NR		Modified to follow the naming and coding standards
 *	
 ******************************************************************************/
package com.cg.bdd.servlet;

import java.io.FileWriter;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cg.bdd.common.Common_Runtime;

public class EditFeatureFileServlet extends HttpServlet {

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * doPost
	 */
	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		Common_Runtime cmrt = new Common_Runtime();
		// ReadTXTFile txtopr = new ReadTXTFile();
		response.setContentType("text/html;charset=UTF-8");
		String fileData = request.getParameter("DemandDetails1");
		String selectedALMTool = request.getParameter("SelectedALMTool");
		String selectedFeature =  request.getParameter("SubFolder1");
		System.out.println("Update ALM Tool String : " + request.getParameter("UpdateToALMTool"));
		boolean updateToALMTool = Boolean.valueOf(request.getParameter("UpdateToALMTool"));
		System.out.println("Update ALM Tool boolean : " + updateToALMTool);
		String resourcesPath = cmrt.m_featurePath;
		ResultSet rs = null;
		System.out.println("Resources Path: " + resourcesPath);

		// Stop: Added by Vikrant

		String FILE_PATH = resourcesPath + "\\"
				+ selectedALMTool + "\\AutomationFramework\\src\\test\\resources\\features\\"
				+ selectedFeature + "\\"
				+ selectedFeature +".feature";
		System.out.println("FILE_PATH: " + FILE_PATH);
		System.out.println("this is open file name......."
				+ request.getParameter("FileName1"));
		// String myContextParam = request.getSession().getServletContext()
		// .getInitParameter("abc1");

		// String realPath = myContextParam.concat(FILE_PATH);

		if (!fileData.equals("")) {
			FileWriter fileWriter = new FileWriter(FILE_PATH, false);
			fileWriter.write(fileData, 0, fileData.length());
			fileWriter.close();
			session.setAttribute("submitDone",
					"Data successfully update into File, put on path : "
							+ FILE_PATH);

		} else {

			session.setAttribute("submitDone",
					"Please select correct information");// Just initialize a
															// random variable.
		}
		if (updateToALMTool)
		{
			String query=null;
			String userStoryID = null;
			try {
				cmrt.connectToDatabase();
				query = "select UserStoryID from userstory where UserStoryName = ?";
				rs = cmrt.executeQuery(query, selectedFeature);
				while (rs.next()) {
					userStoryID = rs.getString("UserStoryID");
					System.out.println("UserStoryID is : "+userStoryID);
				}
				fileData.replaceAll("'", "\\'");
				fileData.replaceAll("\\\\n", "");
				query = "insert into pendingapprovals (`ToolNickName`,`UserStoryID`,`NewStoryDescription`,`Approved`) VALUES (";
				query += "'" + selectedALMTool +"',"  ;
				query += "'" + userStoryID +"',"  ;
				query += "'" + fileData +"',"  ;
				query += "'N'" + ");" ;
				System.out.println("Insert Query is : "+ query);
				cmrt.executeInsertUpdateQuery(query);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		response.sendRedirect("OpenFile.jsp");
	}

	@Override
	public String getServletInfo() {
		return "Text.data- CreateFeatureFileServlet";
	}
}