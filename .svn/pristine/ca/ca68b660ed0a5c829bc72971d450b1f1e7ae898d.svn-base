/******************************************************************************
 *
 *      FilterServlet.java
 *
 *      Capgemini Confidential
 *      CG Source Materials
 *      © Copyright Capgemini 2017
 *
 *
 *******************************************************************************
 *
 *   Date....	WHO 	Description.........................................
 *	10/16/15	--		First Created
 *
 ******************************************************************************/
package com.cg.bdd.servlet;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cg.bdd.properties.BDDPropertyConstant;

;

/**
 * Filters an incoming requests from the JSP pages and provides meaningful
 * messages to the user. by managing session activities.
 * 
 * @author Capgemini
 * 
 */
@WebFilter(urlPatterns = { "/Main_admin.jsp", "/CreateFileNewUI.jsp",
		"/OpenFile.jsp", "/Configure.jsp", "/Run.jsp", "/UserLst.jsp",
		"/AboutUs.jsp", "/Contact1.jsp", "/insert.jsp", "/display.jsp",
		"/RegistrationSuccess.jsp", "/deletedb.jsp" })
public class FilterServlet implements Filter {

	@Override
	public void init(FilterConfig config) throws ServletException {
		// If you have any <init-param> in web.xml, then you could get them
		// here by config.getInitParameter("name") and assign it as field.
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {

		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;
		HttpSession session = request.getSession(false);

		if (session != null) {
			String userName = (String) session
					.getAttribute(BDDPropertyConstant.USER_NAME);
			if (userName == null) {
				if (request.getRequestedSessionId() != null
						&& !request.isRequestedSessionIdValid()) {
					request.setAttribute(
							BDDPropertyConstant.USER_IS_ALREADY_LOGGED_IN_KEY,
							BDDPropertyConstant.USER_IS_ALREADY_LOGGED_IN_VALUE);
					RequestDispatcher rs = request
							.getRequestDispatcher(BDDPropertyConstant.LOGIN_PAGE_NAME);
					rs.include(request, response);
				} else {
					redirectToLoginPage(request, response);
				}
			} else {
				chain.doFilter(request, response);
			}
		} else {
			redirectToLoginPageForNewRequest(request, response);
		}
	}

	/**
	 * This method is used to redirect to Login page
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void redirectToLoginPage(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute(BDDPropertyConstant.USER_IS_NOT_LOGGED_IN_KEY,
				BDDPropertyConstant.USER_IS_NOT_LOGGED_IN_VALUE);
		RequestDispatcher rs = request
				.getRequestDispatcher(BDDPropertyConstant.LOGIN_PAGE_NAME);
		rs.include(request, response);
	}

	/**
	 * This method will redirect to the Login page for new request
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void redirectToLoginPageForNewRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute(BDDPropertyConstant.USER_IS_NOT_LOGGED_IN_KEY,
				BDDPropertyConstant.USER_IS_NOT_LOGGED_IN_VALUE);
		RequestDispatcher rs = request
				.getRequestDispatcher(BDDPropertyConstant.LOGIN_PAGE_NAME);
		rs.include(request, response);
	}

	@Override
	public void destroy() {
		// If you have assigned any expensive resources as field of
		// this Filter class, then you could clean/close them here.
	}

}
