<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<html>
<head>
<title>Registration</title>
</head>
<body>
	<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://in-pnq-coe07:3306/mysqlbdd" user="bdduser"
		password="bdduser" />
	<sql:update dataSource="${dbsource}" var="result">
            INSERT INTO mysqlbdd.users(UserName, UserPassword,UserType, UserActive) VALUES (?,?,?,'Y');            
            <sql:param value="${param.UserName}" />
		<sql:param value="${param.UserPassword}" />
		<sql:param value="${param.UserType}" />
	</sql:update>
	<c:if test="${result>=1}">
		<%
                response.sendRedirect("AddNewUserResponse.jsp");
            %>
	</c:if>
</body>
</html>