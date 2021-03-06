/******************************************************************************
 *
 *      ConfigureServlet.java
 *
 *      Capgemini Confidential
 *      CG Source Materials
 *      � Copyright Capgemini 2017
 *
 *
 *******************************************************************************
 *
 *   Date....	WHO 	Description...............................................
 *	09/02/17	NR		Modified the code to use the new RallyIntegration class
 *  07/03/12    NR		Modified the code to pass the tool name to the RallyIntegration class
 *	
 ******************************************************************************/

package com.cg.bdd.servlet;

import java.io.IOException;
import java.net.URISyntaxException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cg.bdd.common.Common_Runtime;
import com.cg.bdd.main.RallyIntegration;
import com.cg.bdd.main.VersionOneIntegration;

public class ConfigureServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	// Initialize global variables
	public void init() throws ServletException {
	}

	// Process the HTTP Get request

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		String toolNickName = request.getParameter("ToolList");
		String toolName = "";
		//String toolNamebackup = request.getParameter("toolname");
		/*
		 * String ClientPath = request.getParameter("state"); String Extention =
		 * request.getParameter("extention"); System.out.println(Extention);
		 * System.out.println("In.......");
		 */
		System.out.println("servlet context " + this.getServletContext());
		System.out.println("Tool Selected is " + toolNickName);
		
		Common_Runtime cmrt= new Common_Runtime();
		try {
			cmrt.connectToDatabase();
			
			String sql = "SELECT ToolName  FROM mysqlbdd.almtool where ToolNickName = '"+ toolNickName + "';";
			ResultSet res = cmrt.executeQuery(sql);
			while (res.next())
				 toolName = res.getString("ToolName");
		}
		catch(Exception e){
			e.printStackTrace();
		}

		System.out.println("Refresh Button Param : "+request.getParameter("RefreshButton"));
		if (request.getParameter("RefreshButton") != null) {
			System.out.println("In..button2.....");
			if (toolName.trim().equalsIgnoreCase("Rally"))
			{
				RallyIntegration R1;
				
				try {
					 R1 = new RallyIntegration(toolNickName.trim());
					R1.refreshData();
				} catch (URISyntaxException | ClassNotFoundException | SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				finally{
					R1=null;
				}
			}
			else if (toolName.trim().equalsIgnoreCase("versionone"))
			{
				VersionOneIntegration R1;
				try {
					 R1 = new VersionOneIntegration(toolName.trim());
					R1.refreshData();
				} catch (URISyntaxException | ClassNotFoundException | SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				finally{
					R1=null;
				}
			}
		}

		response.sendRedirect("RefreshData.jsp");

	}

}