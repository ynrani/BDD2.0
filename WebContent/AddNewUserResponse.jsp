<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.io.File"%>

<html>
<head>
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords" content="footer, links, icons" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>New User</title>
<script language="javascript">
	function DisableRightClick() {
		if (event.button == 2) {
			alert("Right Click is not possible Here !")
		}

	}
</script>
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
				<div class="centerDiv" align="center">
				<%-- <jsp:include page="RegistrationSuccess.jsp"></jsp:include> --%>
				<font size="5" color='green'>
					<br> <br> <br> Congratulations ! User Created successfully.
					</font>
					<br> <br>
					<a href="Main_admin.jsp"> <font size="5" color='blue'>Go Back  </font></a>
				
				<div class="push"></div>
				<br> <br> <br> <br> <br> <br> <br>
				<br> <br> <br> <br> <br> <br> <br>
				<br> <br> <br> <br> <br>
			</div>
			</div>
			</section>
		</div>
	</div>
	<div class="footerDivToStickToBottom">
		<jsp:include page="Footer.jsp"></jsp:include>
	</div>
</body>

</html>