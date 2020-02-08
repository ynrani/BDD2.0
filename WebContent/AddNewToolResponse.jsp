<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6 lt8"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7 lt8"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8 lt8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<title>New ALM Tool Registration</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description"
	content="Login and Registration Form with HTML5 and CSS3" />
<meta name="keywords"
	content="html5, css3, form, switch, animation, :target, pseudo-class" />
<meta name="author" content="Codrops" />
<link rel="shortcut icon" href="../favicon.ico">
<link rel="stylesheet" type="text/css"
	href="css/demoForRegistration.css" />
<link rel="stylesheet" type="text/css"
	href="css/styleForRegistration.css" />
<link rel="stylesheet" type="text/css"
	href="css/animate-customForRegistration.css" />
</head>
<body>

	<div class="wrapperForCenterOfthePage">

		<div class="mainAll">
			<jsp:include page="Top_admin.jsp"></jsp:include>
			<br>
			<br>
			<br>
			<br>
			<div class="primary-nav" style="height: 0px; width: 1%"></div>
			<br> <br>
			<form id="toolRegisterResponse">
				<div class="row" width=30%>

					<div>
						<span> <font size="5" color='green'> <%
								if (request.getAttribute("queryResponse") != null
									|| (!session.getAttribute("ADMINFLAG").equals(""))) {
								    String responseParameter = request.getParameter( "queryResponse" );
                                    int res=Integer.parseInt(responseParameter);
								    if ( res > 0)
								    {
								%>
								<p style="text-align:center;">The Tool details registered successfully</p>
									<%}
								    else
								    {%>
									<p style="text-align:center;">The Tool details are not registered</p>
								 
								<%}
								 }%>
						</font>
						</span>
					</div>
				</div>
			</form>
		</div>

	</div>

	<div class="footerDivToStickToBottom">
		<jsp:include page="Footer.jsp"></jsp:include>

	</div>
</body>