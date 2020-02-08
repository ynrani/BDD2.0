/******************************************************************************
 *
 *      Users.java
 *
 *      Capgemini Confidential
 *      CG Source Materials
 *      © Copyright Capgemini 2017
 *
 *
 *******************************************************************************
 *
 *   Date....	WHO 	Description.........................................
 *	16/02/17	NR		First Created
 *
 ******************************************************************************/

package com.cg.bdd.main;

import java.sql.SQLException;

import com.cg.bdd.common.Common_Runtime;

public class Users extends Common_Runtime {

	/**
	 * This method is used to create a BDD Framework User
	 * 
	 * @param userName
	 * @param password
	 * @param isAdmin
	 * @return
	 */
	public boolean createUser(String userName, String password, String isAdmin) {
		String insertQuery = "";
		try {
			connectToDatabase();
			insertQuery += "Insert into users (UserName, UserPassword, UserType, UserActive) values (";
			insertQuery += "\"" + userName + "\",";
			insertQuery += "\"" + password + "\",";
			insertQuery += "\"" + isAdmin + "\",";
			insertQuery += "\"Y\");";
			executeInsertUpdateQuery(insertQuery);
			disconnectDatabase();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			return false;
		}

		return true;
	}

	// This method is still incomplete

	/**
	 * This method is used to delete the BDD Framework user
	 * 
	 * @param userName
	 * @return
	 */
	public boolean deleteUser(String userName) {
		String deleteQuery = "";
		int lastRecordID = 0;
		try {
			connectToDatabase();
			lastRecordID = getLastRecordID("users", "UserID") + 1;
			deleteQuery += "delete from users where ";
			deleteQuery += lastRecordID + ",";

			deleteQuery += "\"Y\");";
			executeInsertUpdateQuery(deleteQuery);
			disconnectDatabase();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			return false;
		}

		return true;
	}

	/**
	 * This method is used to update the BDD Framework user details
	 * 
	 * @param userName
	 * @param password
	 * @param isAdmin
	 * @return
	 */
	// Implementation is pending
	public boolean updateUser(String userName, String password, String isAdmin) {
		return false;
	}

}
