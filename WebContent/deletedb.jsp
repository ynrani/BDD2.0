<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
</head>
<body>
	<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://in-pnq-coe07:3306/mysqlbdd" user="bdduser"
		password="bdduser" />
	<sql:update dataSource="${dbsource}" var="count">
            DELETE FROM mysqlbdd.users
            WHERE UserID='${param.UserID}';
        </sql:update>
	<c:if test="${count>=1}">
		<font size="5" color='green'> Congratulations ! Data deleted
			successfully.</font>
		<a href="Main_admin.jsp">Go Home</a>
	</c:if>
</body>
</html>