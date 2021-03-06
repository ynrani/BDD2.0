/******************************************************************************
 *
 *      FileUtility.java
 *
 *     Capgemini Confidential
 *      CG Source Materials
 *      � Copyright Capgemini 2017
 *
 *
 *******************************************************************************
 *
 *   Date....	WHO 	Description.........................................
 *	09/02/17	NR		First Created
 *
 ******************************************************************************/
package com.cg.bdd.file.utils;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.nio.file.CopyOption;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

/**
 * A FileUtility Class to return the full path to the current running java
 * project or it's standard Inputs/Outputs sub-folders depending on which method
 * is called.
 * 
 * 
 */
public class FileUtility {
	static String FSEP = File.separator;

	//
	// Gets the resource path: java - base path
	// @param folderName The name of the resource folder (ie XMI)
	// @param resourceName The name of the resource (ie e112728_2.xmi)
	// @return The path of the resource
	//
	private static String getResourceBasePath(String folderName,
			String resourceFile) {

		String basePath = java.lang.System.getProperty("user.dir");
		String resourcePath = basePath + FSEP + folderName + FSEP
				+ resourceFile;

		return resourcePath;
	}

	/**
	 * Return the project 'Inputs' folder. This will be the java: base path
	 * +"Inputs"
	 * 
	 * @param resourceName
	 *            Append the resource folder name after the Inputs folder
	 * 
	 * @return java: base path +FileSeparator +"Inputs" +FileSeparator
	 *         +<ResourceFolder>
	 */
	public static String getInputFolderResource(String resourceName) {
		return getResourceBasePath("Inputs", resourceName);
	}

	/**
	 * Return the project 'Outputs' folder. This will be the java: base path
	 * +FileSeparator +"Outputs"
	 * 
	 * @param resourceName
	 *            Append the resource folder name after the Outputs folder.
	 * 
	 * @return java: base path +FileSeparator + "Outputs" +FileSeparator
	 *         +<ResourceFolder>
	 */
	public String getOutputFolderResource(String resourceName) {
		return getResourceBasePath("Outputs", resourceName);
	}

	/**
	 * Return the project 'Base' folder. This will be the java projects: base
	 * path
	 * 
	 * @return java: base path +FileSeparator
	 * 
	 */
	public String getBaseFolderResource() {

		String basePath = java.lang.System.getProperty("user.dir") + FSEP;
		return basePath;
	}

	/**
	 * This function will create a new file and writes the text content
	 * 
	 * @param file
	 *            : The name of the file
	 * @param text
	 *            : The content which need to be saved in the file
	 * @throws Exception
	 */
	public void writeToFile(String file, String text, boolean append) throws Exception {

		if (text.compareTo("") == 0) {
			text = System.getProperty("line.separator");
		}

		// Setup Error File
		File OutErr = new File(file);

		try {
			if (OutErr.exists() == false) {
				OutErr.createNewFile();
			}
		} catch (IOException io) {
			throw new IOException(file);
		}

		// Write any lines that do not match to an error file
		FileWriter OutErrWriter = new FileWriter(OutErr, append);

		OutErrWriter.write(text);
		OutErrWriter.close();

	}
	
	public boolean deleteFile(String filePath)
	{
		boolean fileDeleteStatus=false;
		File myFile = new File(filePath);
		if (!myFile.isDirectory())
			fileDeleteStatus = myFile.delete();
		return fileDeleteStatus;
	}

	public boolean createFolderStructure(String folderStructure)
	{
		boolean success = (new File(folderStructure)).mkdirs();
		if (!success) {
			System.out.println("Directory "+ folderStructure +"  is already created");
		}else
		{
			System.out.println("Directory "+ folderStructure +" is successfully created");
		}
		return success;
	}
	
	public void copyFile(String source, String destination) throws IOException
	{
		 Path from = Paths.get(source);
         Path to = Paths.get(destination);
         CopyOption[] options = new CopyOption[]{
           StandardCopyOption.REPLACE_EXISTING,
           StandardCopyOption.COPY_ATTRIBUTES
         }; 
         java.nio.file.Files.copy(from, to.resolve(from.getFileName()), StandardCopyOption.REPLACE_EXISTING);
	}
	public static File getFile(String filePath)
	{
		File myfile=new File(filePath);
		return myfile;
	}
	public static void copyFileUsingStream(File source, File dest) throws IOException {
	    InputStream is = null;
	    OutputStream os = null;
	    try {
	        is = new FileInputStream(source);
	        os = new FileOutputStream(dest);
	        byte[] buffer = new byte[1024];
	        int length;
	        while ((length = is.read(buffer)) > 0) {
	            os.write(buffer, 0, length);
	        }
	    } finally {
	        is.close();
	        os.close();
	    }
	}
	
	//
	// THIS METHOD SHOULD BE MOVED TO THE FILEWRITER CLASS
	//

	/**
	 * This function is used to generates and returns a command text file name
	 * for the given string.
	 * 
	 * @param resultFileName
	 * @return
	 */
	public String generateCmdFileName(String resultFileName) {

		// ensure a default name
		if ((resultFileName == null) || (resultFileName == "")) {
			resultFileName = "default.txt";
		}

		// generate file name
		String rs[] = resultFileName.split(".txt");
		String cmdFile = (rs[0] + "_cmd.txt");

		return cmdFile;
	}

	/**
	 * This function is used to read the Text file and return the contents into
	 * a string
	 * 
	 * @param fileName
	 * @return data of file
	 * @throws IOException
	 */
	public String readTxtFile(String fileName) throws IOException {

		String val = "";
		System.out.println("File name passed is " + fileName);
		InputStream i = this.getClass().getClassLoader().getResourceAsStream(
				fileName);
		BufferedReader r = new BufferedReader(new InputStreamReader(i));

		// reads each line
		String l;
		while ((l = r.readLine()) != null) {
			val = val + l;
		}
		i.close();
		System.out.println(val);
		return val;
	}

	/**
	 * This function is used to read a file and return its content to a
	 * string
	 * 
	 * @param path
	 *            of file
	 * @return contents of file
	 * @throws IOException
	 */
	public String readFile(String path) throws IOException {
		StringBuffer txtFile = new StringBuffer();
		String sCurrentLine;

		BufferedReader br = new BufferedReader(new FileReader(path));

		while ((sCurrentLine = br.readLine()) != null) {
			txtFile.append(sCurrentLine + System.getProperty("line.separator"));
		}
		br.close();
		return txtFile.toString();
	}

}
