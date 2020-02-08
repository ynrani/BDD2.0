<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
</head>
<section class="headerDiv"> <header>
<link
	href="http://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"
	rel="stylesheet">
<!--     <link rel="stylesheet" type="text/css" href="css/tool.css">     -->
<!--Below CSS is for top blue navigation, and displaying the Capgemini logo and menus at proper position  -->
<link rel="stylesheet" type="text/css" href="css/style.css">

<!--Below CSS is for menu items displaying in color format  -->
<link rel="stylesheet" type="text/css" href="css/ManuTab.css">

<!--Below CSS is for tServices drop down menu, and displaying the menu items like about us, contact us, logout etc  -->
<link rel="stylesheet" type="text/css" href="css/dropdemo.css">
<link rel="shortcut icon" href="../favicon.ico">
<!--Below CSS is for the ribbon and color behind the main menu bar START -->
<link rel="stylesheet" type="text/css" href="testcss/default.css" />
<!-- CSS is for the ribbon and color behind the main menu bar END --> <!--Below CSS is for the image comes behind the application menu bar START  -->
<link rel="stylesheet" type="text/css" href="testcss/component.css" />
<!-- CSS is for the image comes behind the application menu bar END -->
<!-- Below css are for footer START-->
<link rel="stylesheet" href="css/footer-distributed.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css">
<!--  css are for footer END--> <script type="text/javascript"
	src="js/jquery-1.2.3.min.js"></script> <script type="text/javascript"
	src="js/jquery.easing.min.js"></script> <script type="text/javascript"
	src="js/jquery.lavalamp.min.js"></script> <script
	src="JavaScript/jquery-1.10.2.js" type="text/javascript"></script> <!-- Below code is added for the page selection when an menu item is selected START-->
<script type="text/javascript">
$(document).ready(function(){
    $('#subnav a').each(function(index) {
        if(this.href.trim() == window.location)
            $(this).addClass("selected");
    });
});
</script> <!--Page selection when an menu item is selected END--> <script
	type="text/javascript">
        $(function() {
            $("#1, #2, #3").lavaLamp({
                fx: "backout",
                speed: 700,
                click: function(event, menuItem) {
                    return false;
                }
            });
        });
        
        function DisableRightClick() 
        {
           if (event.button == 2) 
            {
             alert("Right Click is not possible Here !")
            }
            
         }
    </script> <section class="top-blue-nav">
<div class="primary-nav">
	<div class="navigationwww">
		<ul>
			<li><a href="#" tabindex="1"
				style="color: white; font-weight: normal;">Services<span
					class="arrow-down"></span></a>
				<ul class="dropdownwww">
					<li><a href="AboutUs.jsp" target="m_page"><img
							src="images/about-icon.png" width="20" height="20" alt="" />
							About Us</a></li>
					<li><a href="Contact1.jsp" target="m_page"><img
							src="images/contact-icon.png" width="20" height="20" alt="" />
							Contact Us</a></li>
					<li><a href="${pageContext.request.contextPath}/logout"
						target="_parent"><img src="images/logout-icon.png" width="20"
							height="20" alt="" />Logout(User)</a></li>
				</ul></li>

		</ul>
	</div>
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
<div class="main-nav">
	<div id="cssmenu">
		<ul id="subnav">
			<li id="admin" class="menu-item"><a href="Main_user.jsp">Home</a>
			</li>
			<!-- <li id="gover" class="menu-item"><a href="CreateFileNewUI.jsp"
				target="_self">Build Feature</a></li> -->
			<li class="menu-item"><a href="Run.jsp" TARGET="_self">Execute Tests</a></li>
			<li id="rep" class="menu-item"><a
				href="./BDD/SerenityOptikPOC/target/index.html"
				TARGET="_blank">Report</a></li>
			<!-- <li id="services" class="menu-item"><a href="OpenFile.jsp"
				TARGET="_self">Open Feature</a></li> -->
				<li id="gover" class="menu-item"><a href="#">Feature Files</a>
				<ul class="dropdownwww">
				<li><a href="GenerateFeatureFiles.jsp" target="_self">Generate All Features</a></li>
				<li><a href="CreateFileNewUI.jsp" target="_self">Generate  a  Feature</a></li>
					<li><a href="OpenFile.jsp" TARGET="_self">Edit  a  Feature</a></li>				
				</ul></li>
		</ul>
	</div>
</div>
</section> <section class="title-band">
<div class="title">
	<h3 class="h3Tdm">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h3>
</div>
</section> </header> </section>
</html>