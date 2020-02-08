/******************************************************************************
 *
 *      CreateFeatureFileServlet.java
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

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cg.bdd.common.Common_Runtime;

public class CreateFeatureFileServlet extends HttpServlet {

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * doPost Method
	 */
	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		// String val = "", val1 = "";
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session = request.getSession();
		// FileUtility fileObj = new FileUtility();
		Common_Runtime cmrt = new Common_Runtime();
		PrintWriter out = response.getWriter();

		// 1
		System.out.println("START: Block for Configuration.txt ");

		// String FeatureName = request.getParameter("FeatureName1");
		String DemandStoryName = request.getParameter("DemandStoryName1");
		String toolNickName =  request.getParameter("almtool1");
		String configurablePath = cmrt.m_filePath;
		System.out.println("configurablePath: " + configurablePath);

		String resourcesPath = cmrt.m_filePath + "\\";
		//String resourcesPath = getServletContext().getRealPath(resourcesFolder);
		System.out.println("Resources Folder: " + resourcesPath);

		// START: commented by vikrant

		/*
		 * val = txtopr.ReadingTxtFile(".\\resources\\Configuration.txt");
		 * System.out.println("File Contents" + val);
		 */

		/*
		 * String txtfile = null; if (url != null) { txtfile =
		 * txtopr.ReadingTxtFile(url.getPath()); } String Path = txtfile +
		 * FeatureName + "//"+ DemandStoryName;
		 */

		// STOP: commented by vikrant

		String Path = resourcesPath + "\\" + toolNickName + "\\AutomationFramework\\src\\test\\resources\\features"  + "\\" + DemandStoryName;
		System.out.println("Path: " + Path);

		Boolean success = (new File(Path)).mkdirs();
		if (!success) {
			System.out.println("Directory is already created");
		}

		System.out.println("STOP: Block for Configuration.txt ");

		// 2

		// START: commented by vikrant

		/*
		 * System.out.println("START: Block for extention.txt "); ReadTXTFile
		 * txtopr1 = new ReadTXTFile();
		 * 
		 * val1 = txtopr1.ReadingTxtFile(".\\resources\\extention.txt");
		 * 
		 * System.out.println("File Contents of extention.txt" + val1);
		 */

		/*
		 * url = CreateFeatureFileServlet.class.getClassLoader().getResource(
		 * "extention.txt"); String filePath = null; if (url != null) { filePath
		 * = url.getPath(); } String extention =
		 * txtopr.ReadingTxtFile(filePath);
		 */

		// STOP: commented by vikrant

		// srs
		// String FileName =
		// request.getParameter("DemandFilename2").substring(0,
		// request.getParameter("DemandFilename2").length() - 4);
		String FileName = request.getParameter("DemandFilename2");
		// sre
		String fileData = request.getParameter("DemandTXTArea");

		// String FILE_PATH = Path + "//" + FileName + extention;
		String FILE_PATH = Path + "\\" + FileName + ".feature";
		System.out.println(request.getParameter("DemandFilename2"));
		System.out.println(fileData);
		System.out.println(FILE_PATH);

		if (!fileData.equals("")) {
			// Convenience class for writing character files
			FileWriter fileWriter = new FileWriter(FILE_PATH);
			fileWriter.write(fileData, 0, fileData.length());
			fileWriter.close();
			String Statement = "Data successfully write into File, put on path : "
					+ FILE_PATH;
			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Servlet NewServlet</title>");
			out.println("</head>");
			out.println("<body onLoad=\"showResult();\">");
			out.println("<script>");
			out.println("function showResult(){");
			out.println("alert(\"" + Statement + "\")");
			out.println("}");
			out.println("</script>");
			out.println("</body>");
			out.println("</html>");
			// out.println("Data successfully write into File, put on path : "
			// + "<BR><b>" + FILE_PATH +
			// "</b> <BR>Please click on <a href=\"CreateFileNew.jsp\">Back</a>");
			Statement = "Data is successfully written into File path : "
					+ FILE_PATH;
			session.setAttribute("submitDone", Statement);// Just initialize a
															// random variable.
			response.sendRedirect("CreateFileNewUI.jsp");
		} else {
			// out.println("Please Don't leave any block empty !");
			// out.println("<BR><a href=\"CreateFeatureFileServlet\">Return to Home Page</a>");
			String Statement = "Please select correct information";
			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Servlet NewServlet</title>");
			out.println("</head>");
			out.println("<body onLoad=\"showResult();\">");
			out.println("<script>");
			out.println("function showResult(){");
			out.println("alert(\"" + Statement + "\")");
			out.println("}");
			out.println("</script>");
			out.println("</body>");
			out.println("</html>");

			// response.sendRedirect("CreateFileNew.jsp");
			session.setAttribute("submitDone",
					"Please select correct inforamtion");// Just initialize a
															// random variable.
			response.sendRedirect("CreateFileNewUI.jsp");
		}
		// response.sendRedirect("CreateFileNew.jsp");
		out.close();

	}

	@Override
	public String getServletInfo() {
		return "Text.data- CreateFeatureFileServlet";
	}
}