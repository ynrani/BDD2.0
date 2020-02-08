<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords" content="footer, links, icons" />

<meta http-equiv=Content-Type content="text/html; charset=windows-1252">
<meta name=ProgId content=Word.Document>
<meta name=Generator content="Microsoft Word 12">
<meta name=Originator content="Microsoft Word 12">

<link rel=File-List href="AboutUs_files/filelist.xml">

<!-- these css are for footer -->

<link rel="stylesheet" href="css/footer-distributed.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
<link href="http://fonts.googleapis.com/css?family=Cookie"
	rel="stylesheet" type="text/css">

<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="css/jquery-ui.css">

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
<!--     <link rel="stylesheet" type="text/css" href="css/tool.css">     -->

<!--Below CSS is for top blue navigation, and displaying the Capgemini logo and menus at proper position  -->
<link rel="stylesheet" type="text/css" href="css/CSSForContactPage.css">

<!--Below CSS is for menu items displaying in color format  -->
<link rel="stylesheet" type="text/css" href="css/ManuTab.css">

<!--Below CSS is for tServices drop down menu, and displaying the menu items like about us, contact us, logout etc  -->
<link rel="stylesheet" type="text/css" href="css/dropdemo.css">

<!--Below CSS is for the ribbon and color behind the main menu bar START -->
<link rel="stylesheet" type="text/css" href="testcss/default.css" />
<!-- CSS is for the ribbon and color behind the main menu bar END -->

<!--Below CSS is for the image comes behind the application menu bar START  -->
<link rel="stylesheet" type="text/css" href="testcss/component.css" />
<!-- CSS is for the image comes behind the application menu bar END -->
<script type="text/javascript" src="js/jquery-1.2.3.min.js"></script>
<script type="text/javascript" src="js/jquery.easing.min.js"></script>
<script type="text/javascript" src="js/jquery.lavalamp.min.js"></script>
<script src="JavaScript/jquery-1.10.2.js" type="text/javascript"></script>
<script type="text/javascript">
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
</script>

</head>


<section class="headerDiv"> <header>

<title>BDD</title>
<link
	href="http://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"
	rel="stylesheet">
<!-- Below code is added for the page selection when an menu item is selected START-->
<script type="text/javascript">
	$(document).ready(function() {
		$('#subnav a').each(function(index) {
			if (this.href.trim() == window.location)
				$(this).addClass("selected");
		});
	});
</script> <!--Page selection when an menu item is selected END--> <script
	type="text/javascript">
	$(function() {
		$("#1, #2, #3").lavaLamp({
			fx : "backout",
			speed : 700,
			click : function(event, menuItem) {
				return false;
			}
		});
	});

	function DisableRightClick() {
		if (event.button == 2) {
			alert("Right Click is not possible Here !")
		}

	}
	//srs            document.onmousedown=DisableRightClick;
</script> <section class="top-blue-nav">
<div class="primary-nav">

	<%
		if (session.getAttribute("ADMINFLAG") != null
				|| (!session.getAttribute("ADMINFLAG").equals(""))) {

			boolean isAdmin = (Boolean) session.getAttribute("ADMINFLAG");
			if (isAdmin) {
	%>
	<div class="navigationwww">
		<ul>
			<li class="dropdown"><a href="#" tabindex="1"
				style="color: white; font-weight: normal;" data-toggle="dropdown"
				class="dropdown-toggle">Services<span class="arrow-down"></span></a>
				<ul class="dropdownwww">
					<li><a href="#" target="m_page"><img
							src="images/users-conference-icon.png" width="20" height="20"
							alt="" /> Users </a>
						<ul class="dropdownwww sub-menu">
							<li><a href="insert.jsp" title="AddUser">Add User</a></li>
							<li><a href="display.jsp" title="ListUsers">List Users</a></li>
						</ul></li>
					<li><a href="AboutUs.jsp" target="m_page"><img
							src="images/about-icon.png" width="20" height="20" alt="" />About
							Us</a></li>
					<li><a href="Contact1.jsp" target="m_page"><img
							src="images/contact-icon.png" width="20" height="20" alt="" />Contact
							Us</a></li>
					<li><a href="${pageContext.request.contextPath}/logout"
						target="_parent"><img src="images/logout-icon.png" width="20"
							height="20" alt="" />Logout(Admin)</a></li>
				</ul></li>
		</ul>

	</div>
	<%
		}

			else {
	%>
	<div class="navigationwww">
		<ul>
			<li class="dropdown"><a href="#" tabindex="1"
				style="color: white; font-weight: normal;" data-toggle="dropdown"
				class="dropdown-toggle">Services<span class="arrow-down"></span></a>
				<ul class="dropdownwww">
					<li><a href="AboutUs.jsp" target="m_page"><img
							src="images/about-icon.png" width="20" height="20" alt="" />About
							Us</a></li>
					<li><a href="Contact1.jsp" target="m_page"><img
							src="images/contact-icon.png" width="20" height="20" alt="" />Contact
							Us</a></li>
					<li><a href="${pageContext.request.contextPath}/logout"
						target="_parent"><img src="images/logout-icon.png" width="20"
							height="20" alt="" />Logout(User)</a></li>
				</ul></li>
		</ul>

	</div>
	<%
		}
	%>

	<%
		}
	%>

</div>
<div class="welcome">
	<h5>
		Welcome
		<%
		if (session != null) {
			if (session.getAttribute("uname") != null) {
				String userName = (String) session.getAttribute("uname");
				out.println(userName);
			} else {
				response.sendRedirect("FinalLanding1.jsp");
			}
		}
	%>
	</h5>
</div>
</section> <section class="navigation">
<div class="logo">
	<img src="images/logo-cap.jpg" width="197" height="48" class="logo"
		alt="" />
</div>
<br>
<br>
<br>
<br>




<%
	if (session.getAttribute("ADMINFLAG") != null
			|| (!session.getAttribute("ADMINFLAG").equals(""))) {

		boolean isAdmin = (Boolean) session.getAttribute("ADMINFLAG");
		if (isAdmin) {
%>
<div class="main-nav">
	<div id="cssmenu">
		<ul id="subnav">

			<li id="admin" class="menu-item"><a href="Main_admin.jsp">Home</a>

			</li>

			<li id="gover" class="menu-item"><a href="CreateFileNewUI.jsp"
				target="_self">Build Feature</a></li>


			<li class="menu-item"><a href="Run.jsp" TARGET="_self">Run</a></li>

			<li id="rep" class="menu-item"><a
				href="Demand/serenity/index.html" TARGET="_blank">Report</a></li>


			<li id="services" class="menu-item"><a href="OpenFile.jsp"
				TARGET="_self">Open Feature</a></li>

			<li id="train" class="menu-item"><a href="Setting.jsp"
				TARGET="_self">Setting</a></li>

		</ul>
	</div>
</div>
<%
	}

		else {
%>
<div class="main-nav">
	<div id="cssmenu">
		<ul id="subnav">

			<li id="admin" class="menu-item"><a href="Main_admin.jsp">Home</a>

			</li>

			<li id="gover" class="menu-item"><a href="CreateFileNewUI.jsp"
				target="_self">Build Feature</a></li>

			<li class="menu-item"><a href="Run.jsp" TARGET="_self">Run</a></li>


			<li id="rep" class="menu-item"><a
				href="Demand/serenity/index.html" TARGET="_blank">Report</a></li>


			<li id="services" class="menu-item"><a href="OpenFile.jsp"
				TARGET="_self">Open Feature</a></li>


		</ul>
	</div>
</div>
<%
	}
%> <%
 	}
 %> </section> <section class="title-band">
<div class="title">
	<h3 class="h3Tdm">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h3>
</div>
</section> </header> </section>

<br>
<br>

<body onFocus="parent_disable();" onclick="parent_disable();">

	<div class="wrapperForCenterOfthePage">

		<div class="mainAll">

			<div class="primary-nav" style="height: 50px; width: 30%"></div>
			<br> <br>
			<section class="bodySec"> <br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<div class="container tdm-central"
				style="margin-bottom: 18%; overflow: hidden;">
				<div class="section" style="font-family: courier">
					<div class="container">
						<div class="inner-container">
							<table class="page2-table">
								<tbody>
									<div class=WordSection1>

										<p class=MsoNormal>
											<o:p>&nbsp;</o:p>
										</p>

										<p class=MsoNormal>
											<o:p>&nbsp;</o:p>
										</p>

										<p class=MsoNormal>
											<span
												style='font-size: 10.0pt; line-height: 115%; color: #002060'>Administrator:
												<span style='mso-spacerun: yes'> </span>ABC@Capgemini.com <o:p></o:p>
											</span>
										</p>

										<p class=MsoNormal>
											<span
												style='font-size: 10.0pt; line-height: 115%; color: #002060'>SME:
												<span style='mso-spacerun: yes'> </span>XYZ@Capgemini.com <o:p></o:p>
											</span>
										</p>

										<p class=MsoNormal>
											<span
												style='font-size: 10.0pt; line-height: 115%; color: #002060'>Manager:
												AAA@Capgemini.com <o:p></o:p>
											</span>
										</p>

										<p class=MsoNormal>
											<o:p>&nbsp;</o:p>
										</p>

										<p class=MsoNormal>
											<b><span style='color: #002060'>Thanks &amp;
													Regards,<o:p></o:p>
											</span></b>
										</p>

										<p class=MsoNormal>
											<b><span style='color: #002060'>Agile COE
													team<o:p></o:p>
											</span></b>
										</p>

										<p class=MsoNormal>
											<span
												style='font-size: 10.0pt; line-height: 115%; color: #002060'>_________________________________<u><o:p></o:p></u></span>
										</p>

										<p class=MsoNormal>
											<b><span
												style='font-size: 10.0pt; line-height: 115%; color: #002060; mso-no-proof: yes'>
													<!--[if gte vml 1]><v:shapetype id="_x0000_t75"
 coordsize="21600,21600" o:spt="75" o:preferrelative="t" path="m@4@5l@4@11@9@11@9@5xe"
 filled="f" stroked="f">
 <v:stroke joinstyle="miter"/>
 <v:formulas>
  <v:f eqn="if lineDrawn pixelLineWidth 0"/>
  <v:f eqn="sum @0 1 0"/>
  <v:f eqn="sum 0 0 @1"/>
  <v:f eqn="prod @2 1 2"/>
  <v:f eqn="prod @3 21600 pixelWidth"/>
  <v:f eqn="prod @3 21600 pixelHeight"/>
  <v:f eqn="sum @0 0 1"/>
  <v:f eqn="prod @6 1 2"/>
  <v:f eqn="prod @7 21600 pixelWidth"/>
  <v:f eqn="sum @8 21600 0"/>
  <v:f eqn="prod @7 21600 pixelHeight"/>
  <v:f eqn="sum @10 21600 0"/>
 </v:formulas>
 <v:path o:extrusionok="f" gradientshapeok="t" o:connecttype="rect"/>
 <o:lock v:ext="edit" aspectratio="t"/>
</v:shapetype><v:shape id="_x0000_i1025" type="#_x0000_t75" style='width:22.5pt;
 height:23.25pt;visibility:visible'>
 <v:imagedata src="Contact_files/image001.gif" o:href="cid:image004.gif@01D0D9DE.006E9A80"/>
</v:shape><![endif]--> <![if !vml]><img width=30 height=31
													src="images/image001.gif" v:shapes="_x0000_i1025"> <![endif]>
											</span></b><b><span style='color: #002060'>Capgemini India <span
													class=SpellE>Pvt</span> Ltd
											</span></b><span style='color: #002060'><br> </span><span
												style='font-size: 10.0pt; line-height: 115%; color: #002060'>Financial
												Services Strategic Business Unit<br> Testing Practice -
												Agile COE<br>
											</span><span style='color: black'><a
												href="http://www.capgemini.com/financialservices/"
												title="http://www.capgemini.com/financialservices/"><span
													style='font-size: 10.0pt; line-height: 115%'>www.capgemini.com/financialservices/</span></a></span><span
												style='font-size: 10.0pt; line-height: 115%; color: black'><o:p></o:p></span>
										</p>

										<p class=MsoNormal>
											<span
												style='font-size: 10.0pt; line-height: 115%; color: #002060'><br>
												<span class=GramE><b>A-1, Technology Park, MIDC,
														<span class=SpellE>Talwade</span>, <span class=SpellE>Pune</span>.
												</b></span><b><o:p></o:p></b></span>
										</p>

										<p class=MsoNormal style='margin-top: 6.0pt'>
											<b><span
												style='font-size: 12.0pt; line-height: 115%; color: #009BCC'>People
													matter, results count.</span></b><span style='color: #1F497D'>
												<o:p></o:p>
											</span>
										</p>

										<p class=MsoNormal>
											<o:p>&nbsp;</o:p>
										</p>

									</div>
								</tbody>
							</table>
							<!-- <a href="page3.jsp"><div class="btn-primary btn-cell" style="width: 100px;">Compare Again</div></a> -->
						</div>
					</div>
				</div>
				<div class="push"></div>

				<br> <br> <br> <br> <br> <br> <br>
				<br> <br> <br> <br> <br>

			</div>
			<br>
			<br>

			</section>

		</div>

	</div>

	<div class="footerDivToStickToBottom">
		<jsp:include page="Footer.jsp"></jsp:include>



	</div>




</body>



</html>
