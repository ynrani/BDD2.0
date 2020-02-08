/******************************************************************************
 *
 *      GenerateFeatureFilesServlet.java
 *
 *      Capgemini Confidential
 *      CG Source Materials
 *      � Copyright Capgemini 2017
 *
 *
 *******************************************************************************
 *
 *   Date....	WHO 	Description...............................................
 *	11/04/17	NR		First Created to Generate all features files at once
 *	
 ******************************************************************************/

package com.cg.bdd.servlet;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FilePermission;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.CopyOption;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cg.bdd.common.Common_Runtime;
import com.cg.bdd.file.utils.FileUtility;
import com.cg.bdd.main.SubFolderSearch;


public class GenerateFeatureFilesServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	//private String userStoryName = "";

	// Initialize global variables
	public void init() throws ServletException {
	}

	// Process the HTTP Get request

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		String toolNickName = request.getParameter("ToolList");
		String toolName = "";
		String stepDefs = request.getParameter("CreateStepDefinitions");
		if (stepDefs == null)
			stepDefs = "off";
				//"createStepDefHid");
		//boolean createStepDefs= Boolean.getBoolean(stepDefs);
		Common_Runtime cmrt = new Common_Runtime();
		HttpSession session = request.getSession();
		FileUtility myFileUtil = new FileUtility();
		System.out.println("servlet context " + this.getServletContext());
		System.out.println("Tool Selected is " + toolNickName);
		System.out.println("create Step Definitions: "+ stepDefs);
		System.out.println("Generate Feature Files Param : "+request.getParameter("GenerateFeatures"));
		String resourcesPath = cmrt.m_filePath + "\\";
		System.out.println("Resources Folder: " + resourcesPath);
		//String resourcesPath = getServletContext().getRealPath(resourcesFolder);
		
		/*try {
			cmrt.connectToDatabase();
			
			String sql = "SELECT ToolName  FROM mysqlbdd.almtool where ToolNickName = '"+ toolNickName + "';";
			ResultSet res = cmrt.executeQuery(sql);
			while (res.next())
				 toolName = res.getString("ToolName");
		}
		catch(Exception e){
			e.printStackTrace();
		}
		*/
		if (request.getParameter("GenerateFeatures") != null) {
			System.out.println("Generate Features condition is satisfied");
			//c:\abc\AutomationFramework\src\test\java
			//c:\abc\AutomationFramework\src\test\resources
			String basepath = resourcesPath + "\\" + toolNickName + "\\AutomationFramework\\" ;
			//+ toolName + "\\" ;
			System.out.println("Path: " + basepath);

			myFileUtil.createFolderStructure(basepath);
			try {
				
				createFeatureFiles(toolNickName, basepath);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if (stepDefs.equalsIgnoreCase("on"))
		{
			System.out.println("Create Step Definition files is true");
			String basepath = resourcesPath +"\\" + toolNickName +"\\AutomationFramework\\src\\test\\java\\net\\serenity\\cucumber\\";
			System.out.println("Path: " + basepath+"\\steps");
			myFileUtil.createFolderStructure(basepath +"\\steps");
			System.out.println("Path: " + basepath + "\\pages");
			myFileUtil.createFolderStructure(basepath + "\\pages");
			String currentPath ="" ;
			
			currentPath=this.getClass().getResource("/").getPath();
			currentPath= currentPath.substring(1);
			System.out.println(currentPath);
			currentPath = currentPath.replaceAll("/", "\\\\");
			System.out.println(currentPath);
			//System.out.println("UserDir "+ Myclass.class.getResource(Test.class.getName()));
			String source = currentPath + "\\resources\\AutomationFramework\\";//serenity.properties";
			String destination = resourcesPath +"\\" + toolNickName +  "\\AutomationFramework\\";
			System.out.println("Source : "+source);   
			System.out.println("Destination : "+destination); 
			try {
				copyTemplateFiles(source, destination);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			SubFolderSearch subFld = new SubFolderSearch();
			String folderList = subFld.findByfolder(toolNickName);
			System.out.println("folderList "+ folderList);
			String[] featuresList = folderList.split("~");
			 String mySourceRunner = currentPath + "\\resources\\AutomationFramework\\RunnerClassTemplate.txt";
			 String mySourceStepDef = currentPath + "\\resources\\AutomationFramework\\StepDefinitionTemplate.txt";
			 String fileName="";
			 String stepDefFile = "";
			 String featureFilePath = resourcesPath + "\\" + toolNickName + "\\AutomationFramework\\src\\test\\resources\\features\\" ;
			 for (int i=0; i<featuresList.length; i++)
			 {
				 fileName = featuresList[i];
				 String myDestination = basepath ;//+  fileName + ".java";
				 stepDefFile = fileName + "Steps.java";
				 System.out.println("Destination File " + myDestination);
				 try {
					 createRunnerClassName(fileName.replaceAll(" ", "") + ".java", mySourceRunner, myDestination, featureFilePath + "\\"+ fileName + "\\"+ fileName + ".feature");
					createStepDefinition(stepDefFile.replaceAll(" ", ""), mySourceStepDef, myDestination + "\\steps",featureFilePath + "\\"+ fileName + "\\"+ fileName + ".feature" );
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			 }
			 
			 
			 
			/* if (success)
			 {
				 System.out.println("Path "+myDestination + " is successfully created");
			 String featureFilePath = basePath + "\\src\\test\\resources\\features\\" +userStoryName + "\\" + userStoryName + ".feature";
			 createRunnerClassName(fileName + ".java", mySource, myDestination, featureFilePath);
			 mySource = currentPath + "\\resources\\AutomationFramework\\StepDefinitionTemplate.txt";
			 myDestination = basePath + "\\src\\test\\java\\net\\serenity\\cucumber\\steps\\" + fileName + "Steps.java";
			 System.out.println("Destination File " + myDestination);
			 String stepDefFile = fileName + "Steps";
			 createStepDefinition(stepDefFile, mySource, myDestination, featureFilePath);
			 }
			 else
			 {
				 System.out.println("Failed to create the Path "+myDestination);
			 }*/
			
			
		}
		
		response.sendRedirect("GenerateFeatureFiles.jsp");

	}
	
	
	
	
	
	public void createFeatureFiles(String toolNickName, String basePath) throws Exception
	{
		Common_Runtime cmrt = new Common_Runtime();
		String toolName="";
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
		
		String query = "select * from userstory where IterationID in (select IterationID from iteration where ReleaseID in (Select ReleaseID from bddrelease where ToolID = (select ToolID from almtool where ToolNickName = \"" + toolNickName + "\")));";
		System.out.println("Select Query is :" + query);
		String userStoryID = null;
		String userStoryName =  null;
		String userStoryDesc = null;
		String fileName= null;
		String filePath=null;
		String lineSeparator = System.getProperty("line.separator");
		FileUtility myFileUtil =  new FileUtility();
		ResultSet rs=cmrt.executeQuery(query);
		try {
			rs.beforeFirst();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			while (rs.next())
			{
				userStoryID = rs.getString("UserStoryID");
				userStoryName  = rs.getString("UserStoryName");
				userStoryDesc = rs.getString("UserStoryDescription");
				String path = basePath + "\\src\\test\\resources\\features\\" +userStoryName;
				StringBuffer sbf, fileData=null;
				fileData= new StringBuffer();
				fileData.append("@Tool:"+ toolName + lineSeparator);
				fileData.append("@Release:All" +lineSeparator);
				fileData.append("@Iteration:All" +lineSeparator);
				fileData.append("@UserStory Name:"+ userStoryName + lineSeparator);
				fileData.append("@UserStory Description:"+userStoryDesc + lineSeparator);
				List<String> scenes = null;
				System.out.println("FeatureFile Folder path "+ path);
				 boolean success = myFileUtil.createFolderStructure(path);
				 fileName = userStoryName + ".feature";
					filePath = path + "\\" + fileName;
				if (!success) {
					System.out.println("Directory "+ path +"  is already created");
					File f=new File(filePath);
					if (!(f.exists() && !f.isDirectory())) { 
						sbf = new StringBuffer();
						scenes = cmrt.getScenarios(userStoryID);
						
						for (int i=0;i<scenes.size();i++)
						{
							String scenario = formatScenario(scenes.get(i));
							sbf.append(scenario + lineSeparator);
						}
						fileData.append(sbf);
						myFileUtil.writeToFile(filePath, fileData.toString() , false);
					}
					else
					{
						sbf = new StringBuffer();
						scenes = cmrt.getScenarios(userStoryID);
						for (int i=0;i<scenes.size();i++)
						{
							String scenario = formatScenario(scenes.get(i));
							sbf.append(scenario + lineSeparator);
						}
						fileData.append(sbf);
						myFileUtil.writeToFile(filePath, fileData.toString(), false);
					}
				}else
				{
					System.out.println("Directory "+ path +" is successfully created");
					sbf = new StringBuffer();
					scenes = cmrt.getScenarios(userStoryID);
					for (int i=0;i<scenes.size();i++)
					{
						String scenario = formatScenario(scenes.get(i));
						sbf.append(scenario + lineSeparator);
					}
					fileData.append(sbf);
					myFileUtil.writeToFile(filePath, fileData.toString() , false);
				}
				
			} 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
	public String formatScenario(String scenario)
	{
		//scenario = addLineSeparator(scenario, "Given");
		//scenario = addLineSeparator(scenario, "And");
		String myScenario="";
		myScenario = addLineSeparator(scenario, "But");
		myScenario = addLineSeparator(myScenario, "Then");
		myScenario = addLineSeparator(myScenario, "When");
		System.out.println(myScenario);
		return myScenario;
	}

	public String addLineSeparator(String scenario, String searchStr)
	{
		StringBuffer myString = new StringBuffer();
		String lineSeparator = System.getProperty("line.separator");
		int index = scenario.indexOf(searchStr);
		System.out.println("Index of searchStr " + searchStr + " is : "+ index);
		if (index >= 0)
		{
			if (index==0)
			{
				myString.append(lineSeparator);
				myString.append(scenario.substring(index));
			}
			else
			{
				myString.append(scenario.substring(0, index));
				myString.append(lineSeparator);
				myString.append(scenario.substring(index));
			}
			System.out.println("String with LineSeparator :");
			System.out.println(myString.toString());
			return myString.toString();
		}
		return scenario;
	}
	
	public void copyTemplateFiles(String source, String destination) throws Exception
	{
		FileUtility myFileUtil = new FileUtility();
		String mySource = source +"\\serenity.properties";
		 
		 myFileUtil.copyFile(mySource, destination);
		 mySource = source + "\\pom.xml";
		 myFileUtil.copyFile(mySource, destination);
		 mySource = source + "\\.classpath";
		 myFileUtil.copyFile(mySource, destination);
		 mySource = source + "\\.project";
		 myFileUtil.copyFile(mySource, destination);
		 /*mySource = source + "\\PageObjectTemplate.java";
		 myFileUtil.copyFile(mySource, destination);
		 mySource = source + "\\ScenarioStepsTemplate.java";
		 myFileUtil.copyFile(mySource, destination);
		 mySource = source + "\\StepDefinitionTemplate.txt";
		 myFileUtil.copyFile(mySource, destination);
		 mySource = source + "\\RunnerClassTemplate.txt";
		 myFileUtil.copyFile(mySource, destination);*/
		/* mySource = source + "\\RunnerClassTemplate.txt";
		 String fileName = userStoryName.replaceAll(" ", "");
		 String myDestination = destination + "\\src\\test\\java\\net\\serenity\\cucumber\\" + fileName + ".java";
		 System.out.println("Destination File " + myDestination);
		 createRunnerClass(mySource, myDestination);
		 mySource = source + "\\StepDefinitionTemplate.txt";
		 myDestination = destination + "\\src\\test\\java\\net\\serenity\\cucumber\\steps\\" + fileName + "Steps.java";
		 System.out.println("Destination File " + myDestination);*/
	}
	public void createRunnerClass(String templateFile, String newFileName) throws Exception
	{
		FileUtility myFileUtil = new FileUtility();
		String fileContent = myFileUtil.readFile(templateFile);
		myFileUtil.writeToFile(newFileName, fileContent, false);
	}
	
	
	public void createRunnerClassName(String runnerClassName, String templateFilePath, String runnerClassPath, String featurePath) throws Exception
	{
		FileUtility fileUtil = new FileUtility();
		String sCurrentLine="";
		BufferedReader br = new BufferedReader(new FileReader(templateFilePath));
		StringBuffer sbf= new StringBuffer();
		while ((sCurrentLine = br.readLine()) != null) {
			int ind = sCurrentLine.indexOf("<classname>");
			if (ind>=0)
				sCurrentLine = sCurrentLine.replace("<classname>", runnerClassName);
			
			ind = sCurrentLine.indexOf("<feature_file_path>");
			if (ind>=0)
				sCurrentLine = sCurrentLine.replace("<feature_file_path>", featurePath);
			sbf = sbf.append(sCurrentLine + "\n");
		}
		br.close();
		
		String fileContent = sbf.toString();
		System.out.println("File Content : ");
		System.out.println(fileContent);
		
		
		File myTestFile = new File(runnerClassPath);
        //Tests whether the application can Read  the file
        if (myTestFile.canRead()) {
            System.out.println(myTestFile.getAbsolutePath() + "Can Read: ");
        } 
        else {
            System.out.println(myTestFile.getAbsolutePath() + " Cannot Read: Settign permission for read write and execute");
            FilePermission permission = new FilePermission(runnerClassPath, "read,write,execute");
   		
        }
        fileUtil.writeToFile(runnerClassPath + "\\" + runnerClassName, fileContent, false);

	
	}	
	
	public String extractGherkinString(String searchString, String gherkinKeyword)
	{
		String returnString = "";
		int ind=0, beginIndex, endIndex;
		ind=searchString.indexOf(gherkinKeyword);
		if (ind>0)
		{
				switch (gherkinKeyword)
				{
					case "Given": 
					{
						beginIndex = ind + 5;
						endIndex = searchString.indexOf("When");
						returnString = searchString.substring(beginIndex, endIndex-1);
						break;
					}
					case "When": 
					{
						beginIndex = ind + 4;
						endIndex = searchString.indexOf("Then");
						returnString = searchString.substring(beginIndex, endIndex-1);
						break;
					}
					case "Then": 
					{
						beginIndex = searchString.indexOf("Then");
						returnString = searchString.substring(beginIndex);
						break;
					}
				}
		}
		return returnString;
		
	}
	
	public void createStepDefinition(String stepDefinitionFileName, String templateFilePath, String stepDefinitionClassPath, String featurePath) throws Exception
	{
		FileUtility fileUtil = new FileUtility();
		Common_Runtime cmrt = new Common_Runtime();
		String sCurrentLine="";
		String givenCondition = "", givenFunctionName= "";
		String whenAction = "", whenFunctionName;
		String thenResult = "", thenFunctionName;
		String featureContent = fileUtil.readFile(featurePath);
		System.out.println("The file contents are : \n"
				+ ""+featureContent);
		BufferedReader br=null;
		StringBuffer sbf=null;
		
		String[] scenarios = cmrt.getScenario(featureContent);
		for (int i=0; i<scenarios.length;i++)
		{
				featureContent = scenarios[i];
				System.out.println("Scenario "+i+ "  :\n" + scenarios[i]);
				givenCondition =  extractGherkinString(featureContent,"Given");
				givenCondition = givenCondition.trim();
				givenFunctionName = givenCondition.replaceAll(" ", "_");
				whenAction  =  extractGherkinString(featureContent,"When");
				whenAction = whenAction.trim();
				whenFunctionName = whenAction.replaceAll(" ", "_");
				thenResult =  extractGherkinString(featureContent,"Then");
				thenResult = thenResult.trim();
				thenFunctionName = thenResult.replaceAll(" ", "_");
				br = new BufferedReader(new FileReader(templateFilePath));
				sbf= new StringBuffer();
				while ((sCurrentLine = br.readLine()) != null) {
					int ind = sCurrentLine.indexOf("<classname>");
					if (ind>=0)
						sCurrentLine = sCurrentLine.replace("<classname>", stepDefinitionFileName);
					ind = sCurrentLine.indexOf("<condition>");
					if (ind>=0)
						sCurrentLine = sCurrentLine.replace("<condition>", givenCondition);
					ind = sCurrentLine.indexOf("<givenfunctionname>");
					if (ind>=0)
						sCurrentLine = sCurrentLine.replace("<givenfunctionname>", givenFunctionName);
					
					ind = sCurrentLine.indexOf("<action>");
					if (ind>=0)
						sCurrentLine = sCurrentLine.replace("<action>", whenAction);
					ind = sCurrentLine.indexOf("<whenfunctionname>");
					if (ind>=0)
						sCurrentLine = sCurrentLine.replace("<whenfunctionname>", whenFunctionName);
					
					ind = sCurrentLine.indexOf("<result>");
					if (ind>=0)
						sCurrentLine = sCurrentLine.replace("<result>",thenResult);
					ind = sCurrentLine.indexOf("<thenfunctionname>");
					if (ind>=0)
						sCurrentLine = sCurrentLine.replace("<thenfunctionname>", thenFunctionName);
					
					sbf = sbf.append(sCurrentLine + "\n");
				}
		}
		br.close();
		
		String fileContent = sbf.toString();
		System.out.println("File Content : ");
		System.out.println(fileContent);
		fileUtil.writeToFile(stepDefinitionClassPath + "\\" + stepDefinitionFileName, fileContent, false);
	}	
	
	
	
	public void createFileFromTemplate(String template, String fileName) throws Exception
	{
		FileUtility myFileUtil = new FileUtility();
		String fileContent = myFileUtil.readFile(template);
		myFileUtil.writeToFile(fileName, fileContent, false);
	}
}