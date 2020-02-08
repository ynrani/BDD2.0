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
	<sql:update dataSource="${dbsource}" var="count">
            UPDATE mysqlbdd.users SET UserName=?,UserPassword=?,UserType=?
            WHERE UserID='${param.UserID}';
            <sql:param value="${param.UserName}" />
		<sql:param value="${param.UserPassword}" />
		<sql:param value="${param.UserType}" />
	</sql:update>
	<c:if test="${count>=1}">
		<font size="5" color='green'> Congratulations ! Data updated
			successfully.</font>
		<a href="Main_admin.jsp">Go Back</a>
	</c:if>
				<div class="push"></div>
				<br> <br> <br> <br> <br> <br> <br>
				<br> <br> <br> <br> <br> <br> <br>
				<br> <br> <br> <br> <br>
			</div>
			</section>
		</div>
	</div>
	<div class="footerDivToStickToBottom">
		<jsp:include page="Footer.jsp"></jsp:include>
	</div>
</body>

</html>
