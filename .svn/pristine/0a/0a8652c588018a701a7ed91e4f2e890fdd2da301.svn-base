/******************************************************************************
 *
 *      InsertServlet.java
 *
 *      Capgemini Confidential
 *      CG Source Materials
 *      © Copyright Capgemini 2017
 *
 *
 *******************************************************************************
 *
 *   Date....	WHO 	Description...............................................
 *	09/02/17	NR		Modified the code to use the RallyIntegrationNew class
 *	
 ******************************************************************************/

package com.cg.bdd.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cg.bdd.main.Users;

public class InsertServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	// Initialize global variables
	public void init() throws ServletException {
	}

	// Process the HTTP Get request

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		String userName = request.getParameter("name");
		String password = request.getParameter("password");
		String adminFlag = request.getParameter("adminFlag");
		System.out.println("UserName : " + userName);
		System.out.println("Password : " + password);
		System.out.println("AdminFlag :" + adminFlag);
		Users userObj = new Users();
		// RallyIntegration R1 = new RallyIntegration();

		if (request.getParameter("save") != null) {
			System.out.println("Creating the User");
			userObj.createUser(userName, password, adminFlag);
		}

		response.sendRedirect("Configure.jsp");

	}

}