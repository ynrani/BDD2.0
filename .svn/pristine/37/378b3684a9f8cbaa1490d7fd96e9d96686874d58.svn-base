/******************************************************************************
 *
 *      LogoutServlet.java
 *
 *      Capgemini Confidential
 *      CG Source Materials
 *      © Copyright Capgemini 2017
 *
 *
 *******************************************************************************
 *
 *   Date....	WHO 	Description.........................................
 *  10/16/15 	--		First Created
 *	15/02/17	NR		Modified to follow the Naming and coding standards
 *
 ******************************************************************************/
package com.cg.bdd.servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cg.bdd.properties.BDDPropertyConstant;

/**
 * Invalidates the session of the current logged in user.
 * 
 * @author Capgemini
 * 
 */
@WebServlet(urlPatterns = { "/logout" })
public class LogoutServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.invalidate();
		}
		request.setAttribute(BDDPropertyConstant.USER_IS_LOGGED_OUT_KEY,
				BDDPropertyConstant.USER_IS_LOGGED_OUT_VALUE);
		RequestDispatcher requestDispatcher = request
				.getRequestDispatcher(BDDPropertyConstant.LOGIN_PAGE_NAME);
		requestDispatcher.include(request, response);
	}
}
