
<%@page import="java.util.ListIterator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>Data Comparison Tool</title>
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

<body>
	<header>
	<div class="top-blue-nav">
		<!--Primary Navigation Menu Start-->
		<div class="container">
			<div class="primary-nav">
				<nav>
				<ul>
					<li><a href="#"><img src="images/about-icon.png"
							width="20" height="20" alt="" /> About Us</a></li>
					<li><a href="#"><img src="images/contact-icon.png"
							width="20" height="20" alt="" /> Contact Us</a></li>
					<!--<li><a href="#"><img src="images/logout-icon.png" width="20" height="20" alt=""/> Logout</a></li>-->
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
			<div class="client-logo">
				<!--logo Start-->
				<img src="images/clientlogo.png" width="197" height="48" alt="" />
				<!--logo Ends-->
			</div>
			<div class="clearfloat">&nbsp;</div>
		</div>
	</div>
	<div class="title-band">
		<div class="container">
			<div class="title">
				<h3>CSA-BDD AUTOMATION</h3>
			</div>
			<div class="clearfloat">&nbsp;</div>
		</div>
	</div>
	</header>

	<div class="section">
		<div class="container">
			<div class="inner-container">
				<table class="page2-table">
					<tbody>
						<form name="form" action="EditFeatureFileServlet" method="post">


							<nav> <a href="page4.jsp"
								style="background-color: lightblue">Create FutureFile</a> | <a
								href="page5.jsp" style="background-color: lightblue">Create
								Step Definition</a> | <a href="#">Import future files</a> | <a
								href="#">Run Test caes</a> | <a href="#">Open future file</a>| <a
								href="#">Show Report</a>| <a href="#">Open Config</a></nav>

							<br />
							<br />
							<br />
							<center>
								Create Step Definition<br>
								<textarea name="fileData" rows="15" cols="50" /></textarea>
								<br> <br>Text File name:<input type="text"
									name="fileData1"> <BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
									type="submit" value="Write In File" /> <input type="reset"
									value=" Reset " />
							</center>
						</form>
					</tbody>
				</table>
				<!-- <a href="page3.jsp"><div class="btn-primary btn-cell" style="width: 100px;">Compare Again</div></a> -->
			</div>
		</div>
	</div>

	<div class="footer">
		<div class="container">
			<div class="footer-logo">
				<img src="images/cap-logo.jpg" width="151" height="36" alt="" />
			</div>
			<div class="footer-txt">
				<p>Copyright &copy; 2015 Â· All rights reserved</p>
			</div>
			<div class="clearfloat">&nbsp;</div>
		</div>
	</div>
</body>

</html>
