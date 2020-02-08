<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/custom.css">
<link rel="stylesheet" type="text/css" href="css/demo.css" />
<link rel="stylesheet" type="text/css" href="css/style1.css" />
<link rel="stylesheet" type="text/css" href="css/animate-custom.css" />
<link rel="stylesheet" type="text/css" href="css/menu.css" />
<link rel="stylesheet" type="text/css" href="css/theme.default.css">
<link rel="stylesheet" type="text/css" href="css/stylesNew.css">
<link rel="stylesheet" type="text/css" href="css/magnific-popup.css">

<script type="text/javascript" src="js/html5.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.tablesorter.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
<script type="text/javascript" src="js/main.js"></script>
<script type="text/javascript" src="js/jquery.validate.min.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/jquery.magnific-popup.js"></script>
<script type="text/javascript" src="js/jquery.magnific-popup.min.js"></script>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CSA-BDD AUTOMATION</title>
<link
	href="http://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/tool.css">

<!--[if lt IE 9]>
<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="js/jquery-ui.js"></script>

</head>

<body style="font-family: courier">

	<header>
	<div class="top-blue-nav">
		<!--Primary Navigation Menu Start-->
		<div class="container">
			<div class="primary-nav">
				<nav>
				<ul>
					<li><font face="Calibri" color="green"><a
							href="FinalLanding1.jsp"><img src="images/home1.jpg"
								width="30" height="30" alt="" />Home</a></font>></li>
					<!-- <li><a href="#"><img src="images/contact-icon.png"
							width="20" height="20" alt="" /> Contact Us</a></li> -->
					<!-- <li><a href="logout.jsp"><img src="images/logout-icon.png" width="20" height="20" alt=""/> Logout</a></li> -->
				</ul>
				</nav>
			</div>
			<div class="welcome">
				<h5>&nbsp;</h5>
			</div>
			<div class="clearfloat">&nbsp;</div>
		</div>
		<!--Primary Navigation Menu Ends-->
	</div>
	<div class="navigation">
		<div class="container">
			<div class="logo">
				<!--logo Start-->
				<img src="images/logo-cap.jpg" width="197" height="48" alt="" />
				<!--logo Ends-->
			</div>

			<div class="clearfloat">&nbsp;</div>
		</div>
	</div>
	<div class="navigation">
		<div class="container">

			<div class="clearfloat">&nbsp;</div>
		</div>
	</div>
	</header>


	<div class="section">
		<div class="container">


			<form method="post" action="login">
				<div class="inner-container">
					<table>
						<tr>
							<th align="left"></th>
							<td><%@page import="java.util.*"%> <%session.invalidate();%>
								You have logged out. Plese <a href="FinalLanding1.jsp"
								target="_parent"><b>Login</b></a></td>
						</tr>
					</table>

				</div>
			</form>
		</div>
	</div>

	<footer class="footer">
	<div class="container">
		<div class="footer-logo">
			<img src="images/cap-logo.jpg" width="151" height="36" alt="" />
		</div>
		<div class="footer-txt">
			<p>Copyright &copy; 2015 Â· All rights reserved</p>
		</div>
		<div class="clearfloat">&nbsp;</div>
	</div>
	</footer>

</body>
</html>
