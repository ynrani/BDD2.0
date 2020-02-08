/******************************************************************************
 *
 *      ExecuteAUTAutomationServlet.java
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

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cg.bdd.common.Common_Runtime;


/**
 * 
 * @author Vikrant Dheer
 * 
 */
public class ExecuteAUTAutomationServlet extends HttpServlet {

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -3371451267488628665L;

	/**
	 * doPost
	 */
	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		Process p = null;
		response.setContentType("text/html;charset=UTF-8");
		String autPath=request.getParameter("autpath");
		System.out.println(autPath);
		String[] featuresSelected = request
				.getParameterValues("featuresSelected");
		
		if (featuresSelected != null) {
			for (int i = 0; i < featuresSelected.length; i++) {
				System.out.println(featuresSelected[i]);
			}
		}

		try {
			String scriptPath = autPath + "\\AUTScript.bat";
			System.out.println("scriptPath: " + scriptPath);
			String command = "cmd.exe /C start CALL " + "\"" + scriptPath
					+ "\" " + "\"" + autPath + "\"";
			System.out.println("command: " + command);
			p = Runtime.getRuntime().exec(command);
			//p = Runtime.getRuntime().exec("mvn -f "+path+"/pom.xml clean verify");
			//p = Runtime.getRuntime().exec("mvn -f D:\\Rani\\BDD\\SerenityOptikPOC/pom.xml clean verify");
			BufferedReader reader = new BufferedReader(new InputStreamReader(
					p.getInputStream()));
			String line = reader.readLine();
			while ((line) != null) {
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect("Run.jsp");
	}

	@Override
	public String getServletInfo() {
		return "Text.data- CreateFeatureFileServlet";
	}
}