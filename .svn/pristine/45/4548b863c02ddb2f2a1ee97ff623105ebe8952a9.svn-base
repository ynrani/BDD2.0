/******************************************************************************
 *
 *      ALMToolServlet.java
 *
 *      Capgemini Confidential
 *      CG Source Materials
 *      © Copyright Capgemini 2017
 *
 *
 *******************************************************************************
 *
 *   Date....	WHO 	Description...............................................
 *	28/02/17	NR		First Created
 *	
 ******************************************************************************/

package com.cg.bdd.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.cg.bdd.common.*;

public class ALMToolServlet extends HttpServlet {
	// Initialize global variables
	/*
	 * public void init() throws ServletException { }
	 */
	// Process the HTTP Get request

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Common_Runtime cmrt = new Common_Runtime();
		int queryResponse = 0;
		response.setContentType("text/html;charset=UTF-8");
		String toolName = request.getParameter("toolName");
		String toolNickName =  request.getParameter("toolNickName");
		String toolUrl = request.getParameter("toolUrl");
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		String projectName = request.getParameter("projectName");
		String workspaceName = request.getParameter("workspaceName");
		System.out.println("UserName : " + userName);
		System.out.println("Password : " + password);

		/*
		 * if (request.getParameter("save") != null) {
		 */
		// System.out.println("Creating the User");
		try {
			cmrt.connectToDatabase();
			String query = "INSERT INTO mysqlbdd.almtool (ToolName,ToolNickName, WorkspaceName,ProjectName,ToolURL,ToolUserName,ToolPassword,ToolActive) values(";
			query += "\"" + toolName + "\",";
			query += "\"" + toolNickName + "\",";
			query += "\"" + workspaceName + "\",";
			query += "\"" + projectName + "\",";
			query += "\"" + toolUrl + "\",";
			query += "\"" + userName + "\",";
			query += "\"" + password + "\",";
			query += "\"Y\");";
			queryResponse = cmrt.executeInsertUpdateQuery(query);
			System.out.println("Query Response is " + queryResponse);

		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// }
		response.setContentType("application/text");
		response.setCharacterEncoding("UTF-8");
		response.sendRedirect("AddNewToolResponse.jsp?queryResponse="
				+ queryResponse);
	}

	protected void dispatch(HttpServletRequest request,
			HttpServletResponse response, String page)
			throws javax.servlet.ServletException, java.io.IOException {
		RequestDispatcher dispatcher = getServletContext()
				.getRequestDispatcher(page);
		dispatcher.forward(request, response);
	}

}
