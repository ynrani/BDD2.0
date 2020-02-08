<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link rel="stylesheet" href="css/lavalamp_test.css" type="text/css"
	media="screen">
<!--[if lt IE 9]>
<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
<script type="text/javascript" src="js/jquery-1.2.3.min.js"></script>
<script type="text/javascript" src="js/jquery.easing.min.js"></script>
<script type="text/javascript" src="js/jquery.lavalamp.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		$("#1, #2, #3").lavaLamp({
			fx : "backout",
			speed : 700,
			click : function(event, menuItem) {
				return false;
			}
		});
	});

	var popupWindow = null;

	function child_open() {

		popupWindow = window
				.open('my.jsp', 'popuppage',
						'width=300,toolbar=1,resizable=1,scrollbars=yes,height=300,top=100,left=100');
		if (popupWindow.opener == null) {
			popupWindow.opener = self;
		}

	}

	function parent_disable() {
		if (popupWindow && !popupWindow.closed)
			popupWindow.focus();

	}

	function fnLoadReleaseList() {

		var selectedValue = $(this).find(":selected").val();
		$.ajax({

			url : "a.html",
			type : "POST",
			async : true,
			success : function(result) {
				var countryListArray = result.split('~');
				for (var i = 0; i < countryListArray.length; i++) {
					$("#RelaseList").append(
							'<option value='+i+'>' + countryListArray[i]
									+ '</option>');

				}

			}
		});

	}
</script>

</head>

<body onFocus="parent_disable();" onclick="parent_disable();"
	onload="fnLoadReleaseList()">
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
					<li><a href="logout.jsp"><img src="images/logout-icon.png"
							width="20" height="20" alt="" /> Logout</a></li>

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
						<form name="Prentform" action="CreateFeatureFileServlet" method="post"
							onFocus="parent_disable();" onclick="parent_disable();">

							<!-- <nav> <a href="page4.jsp"
								style="background-color: lightblue">Create FutureFile</a> | <a
								href="page5.jsp" style="background-color: lightblue">Create Step Definition</a> | <a href="#">Import
								future files</a> | <a href="#">Run Test caes</a> | <a
								href="#">Open future file</a>| <a href="#">Show
								Report</a>| <a href="#">Open Config</a></nav>
 -->

							<ul class="lavaLampWithImage" id="1">
								<li class="current"><a href="#">Create Feature File</a></li>
								<li><a href="page4.jsp">Create Step Definition</a></li>
								<li><a href="page5.jsp">Import feature file</a></li>
								<li><a href="page5.jsp">Open feature file</a></li>
								<li><a href="page5.jsp">Show Report</a></li>
								<li><a href="page5.jsp">Open Config</a></li>
							</ul>

							<br />
							<br />
							<br />
							<!-- <input type="button" value="choice"  name="choice" onclick="javascript:child_open()" > -->
							Select Release: <br> <select name="RelaseList"
								id="RelaseList"">
								<option value="">Select Release</option>
								<c:if test="${!empty countryList}">
									<c:forEach items="${countryList}" var="cont">
										<option value="${cont}">"${cont}"</option>
									</c:forEach>
								</c:if>
							</select> <input type="hidden" id="ReleaseName" name="ReleaseName"
								value="" /> <input type="hidden" id="IterationName"
								name="IterationName" value="" /> <input type="hidden"
								id="FeatureName" name="FeatureName" value="" /> <input
								type="hidden" id="DemandStoryName" name="DemandStoryName"
								value="" />
							<center>
								Create FutureFile<BR>
								<textarea name="fileData" id="filedata" rows="13" cols="50"
									onFocus="parent_disable();" onclick="parent_disable();" />
								</textarea>
								<br> <br>Text File name:<input type="text"
									id="fileData1" name="fileData1" onFocus="parent_disable();"
									onclick="parent_disable();"> <BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="submit" value="Write In File" /> <input
									type="reset" value=" Reset " />
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
