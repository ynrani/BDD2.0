<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
</head>
<body>
<form action="updatedb.jsp" method="post">
	<div class="wrapperForCenterOfthePage">
		<div class="mainAll">
			<jsp:include page="Top_admin.jsp"></jsp:include>
			<br> <br> <br> <br>
			<div class="primary-nav" style="height: 0px; width: 1%"></div>
			<br> <br>
			<section class="bodySec">
			<div class="container tdm-central"
				style="margin-bottom: 2%; overflow: hidden; right: 4%;">
				<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://in-pnq-coe07:3306/mysqlbdd" user="bdduser"
		password="bdduser" />

	<sql:query dataSource="${dbsource}" var="result">
            SELECT * from mysqlbdd.users where UserID=?;
            <sql:param value="${param.UserID}" />
	</sql:query>
	<font size="5" color='green'>
		<table border="0" width="40%" align="center">
		<tr ><td colspan=4>&nbsp;</td></tr>
		
			<tr align="center" >
				<td colspan=4>
					<u>Update User Information</u>
				</td>
			</tr>
			<tr ><td colspan=4>&nbsp;</td></tr>
			<tr ><td colspan=4>&nbsp;</td></tr>

			<tr>
				<th>UserName</th>
				<th>Password</th>
				<th>UserType</th>
			</tr>
			<c:forEach var="row" items="${result.rows}">
				<tr>
					<td><input type="hidden" value="${row.UserID}" name="UserID" />
						<input type="text" value="${row.UserName}" name="UserName" /></td>
					<td><input type="text" value="${row.UserPassword}"
						name="UserPassword" /></td>
					<td><input type="text" value="${row.UserType}" name="UserType" /></td>
					<td><input type="submit" value="Update" /></td>
				</tr>
			</c:forEach>
		</table>
		</font>
		<!-- <a href="Main_admin.jsp">Go Home</a> -->
	
				<div class="push"></div>
				<br> <br> <br> <br> <br> <br> <br>
				<br> <br> <br> <br> <br> <br> <br>
				<br> <br> <br> <br> <br>
			</div>
			</section>
		</div>
	</div>
</form>	
</body>
</html>