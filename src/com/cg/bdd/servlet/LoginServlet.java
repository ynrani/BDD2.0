/******************************************************************************
 *
 *      LoginServlet.java
 *
 *      Capgemini Confidential
 *      CG Source Materials
 *      � Copyright Capgemini 2017
 *
 *
 *******************************************************************************
 *
 *   Date....	WHO 	Description.........................................
 *	15/02/17	NR		Modified to follow the Naming and coding standards
 *
 ******************************************************************************/

package com.cg.bdd.servlet;

import java.io.*;
import java.sql.SQLException;

import javax.servlet.*;
import javax.servlet.http.*;

import com.cg.bdd.common.Common_Runtime;
import com.cg.bdd.properties.BDDPropertyConstant;

@SuppressWarnings("serial")
public class LoginServlet extends HttpServlet {
	public String UserStatus;

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		String userName = request.getParameter("uname");
		String password = request.getParameter("pass");
		System.out.println(userName);
		System.out.println(password);
		String userType = "";
		try {
			HttpSession session = request.getSession();
			Common_Runtime cmrt = new Common_Runtime();
			if (!session.isNew()) {
				session.invalidate();
				session = request.getSession();
			}
			session.setAttribute("uname", userName);
			// Check if the user is valid registered user
			userType = cmrt.getUserType(userName).toLowerCase();
			
			switch(userType)
			{
				case "admin" : 
				{
					session.setAttribute("ADMINFLAG", new Boolean(true));
					RequestDispatcher rs = request
							.getRequestDispatcher("Main_admin.jsp");
					rs.include(request, response);
				}
				break;
				case "manager" : 
				{
					session.setAttribute("ADMINFLAG", new Boolean(true));
					RequestDispatcher rs = request
							.getRequestDispatcher("Main_admin.jsp");
					rs.include(request, response);
				}
				break;
				case "user" : 
				{
					session.setAttribute("ADMINFLAG", new Boolean(false));
					RequestDispatcher rs = request
							.getRequestDispatcher("Main_user.jsp");
					rs.include(request, response);
				}
				break;
				default:
				{
					request.setAttribute(
							BDDPropertyConstant.INVALID_USER_NAME_OR_PASSWORD_KEY,
							BDDPropertyConstant.INVALID_USER_NAME_OR_PASSWORD_VALUE);
					RequestDispatcher rs = request
							.getRequestDispatcher(BDDPropertyConstant.LOGIN_PAGE_NAME);
					rs.include(request, response);
				}	
			}

			/*if ((userType.equalsIgnoreCase("admin")) || (userType.equalsIgnoreCase("manager"))) {
				session.setAttribute("ADMINFLAG", new Boolean(true));
				RequestDispatcher rs = request
						.getRequestDispatcher("Main_admin.jsp");
				rs.include(request, response);
			} else if (userType.equalsIgnoreCase("user")) {
				session.setAttribute("ADMINFLAG", new Boolean(false));
				RequestDispatcher rs = request
						.getRequestDispatcher("Main_user.jsp");
				rs.include(request, response);
			}

			else {
				request.setAttribute(
						BDDPropertyConstant.INVALID_USER_NAME_OR_PASSWORD_KEY,
						BDDPropertyConstant.INVALID_USER_NAME_OR_PASSWORD_VALUE);
				RequestDispatcher rs = request
						.getRequestDispatcher(BDDPropertyConstant.LOGIN_PAGE_NAME);
				rs.include(request, response);
			}*/
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}