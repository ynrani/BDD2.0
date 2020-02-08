/******************************************************************************
 *
 *      SubFolderSearch.java
 *
 *     Capgemini Confidential
 *      CG Source Materials
 *      � Copyright Capgemini 2017
 *
 *
 *******************************************************************************
 *
 *   Date....	WHO 	Description.........................................
 *	09/02/17	NR		Modified to follow naming and coding standards
 *
 ******************************************************************************/

package com.cg.bdd.main;

import java.io.File;
import java.io.FilenameFilter;
import java.io.IOException;

import com.cg.bdd.common.Common_Runtime;

public class SubFolderSearch {

	/**
	 * This method is used to find all the sub folders within the search path
	 * sent as a parameter
	 * 
	 * @param SubfolderNamePath
	 *            : The path of for searching
	 * @return : A String separated by ~ listing all the sub folders in the
	 *         given search path
	 * @throws IOException
	 */
	public String findByfolder(String SubfolderNamePath) throws IOException {
		System.out.println("Inside findByfolder of SubFolderSearch"
				+ SubfolderNamePath);

		Common_Runtime cmrt = new Common_Runtime();

		String mainpath = cmrt.m_featurePath;
		mainpath = mainpath + SubfolderNamePath;
		System.out.println("Path written in config file + subfoldername SubFolderSearch.java"
				+ mainpath);
		if (!mainpath.contains("AutomationFramework"))
			mainpath = mainpath + "\\AutomationFramework\\src\\test\\resources\\features\\";
		StringBuffer sbf1folder = new StringBuffer();
		File directory = new File(mainpath);
		System.out.println("Directory: " + directory);
		// get all the files from a directory
		File[] fList = directory.listFiles();
		System.out.println("Length of files in directory: " + fList.length);
		for (File file : fList) {
			if (file.isDirectory()) {
				System.out.println(" In ELSE block.. FileName: "
						+ file.getName());
				sbf1folder.append(file.getName() + "~");
			}
			 else 
			if (file.isFile()) {
				System.out.println(" In IF block..Absolute Path: "
						+ file.getAbsolutePath());
				System.out.println(" In IF block..FileName: " + file.getName());
				sbf1folder.append(directory.getName() + "~");
			}
		}
		
		String result= sbf1folder.toString();
		int len = result.length();
		char lastChar = result.charAt(len-1);
		if (lastChar=='~')
			result = result.substring(0, result.length()-1);
		System.out.println("This is given back to SelectionControllerServlet: "
				+ result);
		//return sbf1folder.toString();
		return result;
	}

	/**
	 * This class was existing. Not sure where it is used.
	 * 
	 */
	public class GenericExtFilter implements FilenameFilter {

		private String ext;

		public GenericExtFilter(String ext) {
			this.ext = ext;
		}

		public boolean accept(File dir, String name) {
			return (name.endsWith(ext));
		}
	}

	/**
	 * This function is will verify whether a folder exists based on the
	 * parameters sent and returns a boolean value
	 * 
	 * @param demand
	 *            : The final value of the requested operation
	 * @param feature
	 *            : The feature for which the search is done
	 * @param storyID
	 *            : The user story id for searching
	 * @return
	 */
	public Boolean folderFileexist(String demand, String feature, String storyID) {

		System.out.println("Inside folderFileexist of SubFolderSearch");

		Common_Runtime cmrt = new Common_Runtime();

		String mainpath = cmrt.m_filePath;
		System.out.println(mainpath);
		File varTmpDir = new File(mainpath + feature + "//" + demand);
		// System.out.println(varTmpDir);
		boolean folderexists = varTmpDir.exists();
		System.out.print("folder exist =" + folderexists);
		System.out.print("folder exist =" + varTmpDir.isDirectory());
		if (folderexists)
			System.out.println("exists");

		if (varTmpDir.isDirectory())
			System.out.println("/var/tmp is a directory");

		// test to see if a file exists
		File file1 = new File(mainpath + feature + "//" + demand + "//"
				+ storyID + ".txt");
		// System.out.println(file1);
		boolean fileexists = file1.exists();
		System.out.print("file Exist" + fileexists);

		if (fileexists == false) {
			file1 = new File(mainpath + feature + "//" + demand + "//"
					+ storyID + ".feature");
			fileexists = file1.exists();
			System.out.print("file Exist" + fileexists);

		}

		if (file1.exists() && file1.isFile()) {
			System.out.println("file exists, and it is a file");
		}

		if (fileexists == true && folderexists == true) {
			return true;
		} else {
			return false;
		}
	}

}
