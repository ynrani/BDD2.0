<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html>
<head>
<title>SELECT Operation</title>
<script>
            function confirmGo(m,u) {
                if ( confirm(m) ) {
                    window.location = u;
                }
            }
        </script>
</head>
<body>
<font size="4" color='green'>
	<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://in-pnq-coe07:3306/mysqlbdd" user="bdduser"
		password="bdduser" />

	<sql:query dataSource="${dbsource}" var="result">
            SELECT * FROM mysqlbdd.users;
        </sql:query>
	<center>
		<form>
			<table border="1" width="40%" >
			<tr colspan="5">
				<caption>User List</caption> </tr>
				<tr>
					<th align="left">UserName</th>
					<th  align="left">Password</th>
					<th align="left">UserType</th>
					<th colspan="2" align="center">User Action</th>
				</tr>
				<c:forEach var="row" items="${result.rows}">
					<tr>
						<td><c:out value="${row.UserName}" /></td>
						<td><c:out value="${row.UserPassword}" /></td>
						<td><c:out value="${row.UserType}" /></td>
						<td><a
							href="update.jsp?UserID=<c:out value="${row.UserID}"/>">Update</a></td>
						<td><a
							href="javascript:confirmGo('Sure to delete this record?','deletedb.jsp?UserID=<c:out value="${row.UserID}"/>')">Delete</a></td>

					</tr>
				</c:forEach>
			</table>
		</form>
		<a href="Main_admin.jsp">Go Back</a>
	</center>
	</font>
</body>
</html>