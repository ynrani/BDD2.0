<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <meta http-equiv="X-UA-Compatible" content="IE=Edge"> -->
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
<style>
.style-1 input[type="text"] {
	padding: 10px;
	border: solid 1px #dcdcdc;
	transition: box-shadow 0.3s, border 0.3s;
}

.style-1 input[type="text"]:focus, .style-1 input[type="text"].focus {
	border: solid 1px #707070;
	box-shadow: 0 0 5px 1px #969696;
}

.style-1 input[type="password"] {
	padding: 10px;
	border: solid 1px #dcdcdc;
	transition: box-shadow 0.3s, border 0.3s;
}

.style-1 input[type="password"]:focus, .style-1 input[type="password"].focus
	{
	border: solid 1px #707070;
	box-shadow: 0 0 5px 1px #969696;
}

body {
	background-image: url("images/images.png");
	background-repeat: no-repeat;
	background-size: 100% 100%;
}

html {
	height: 100%
}
</style>
</head>
<body style="font-family: courier">
	<header>
	<div class="top-blue-nav">
		<!--Primary Navigation Menu Start-->
		<div class="container">
			<div class="primary-nav">
				<nav>
				<ul>

					<li><a href="AboutUsStatic.jsp"><img
							src="images/about-icon.png" width="20" height="20" alt="" />
							About Us</a></li>
					<li><a href="Contact.jsp"><img
							src="images/contact-icon.png" width="20" height="20" alt="" />
							Contact Us</a></li>
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
	<div class="navigation">
		<div class="container">
			<div class="logo">
				<img src="images/6644.png" width="197" height="48" alt="" />
			</div>
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
							<th align="left">User name:</th>
							<td>
								<ul class="input-list style-1 clearfix">
									<input type="text" name="uname" />
								</ul>
							</td>
						</tr>
						<tr>
							<th align="left">Password:</th>
							<td>
								<ul class="input-list style-1 clearfix">
									<input type="password" name="pass" />
								</ul>
							</td>

						</tr>
						<tr>
							<!-- <td><a href="page2.html"><div class="btn-primary btn-cell">Compare</div></a></td> -->
						</tr>

					</table>

					<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="submit" value="Login"
						style="background-color: #1E90FF; height: 35px; width: 100px"
						align="left" />
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
	<script type="text/javascript">
		$(function() {
			$('[placeholder]').focus(function() {
				var input = $(this);
				if (input.val() == input.attr('placeholder')) {
					input.val('');
					input.removeClass('placeholder');
				}
			}).blur(
					function() {
						var input = $(this);
						if (input.val() == ''
								|| input.val() == input.attr('placeholder')) {
							input.addClass('placeholder');
							input.val(input.attr('placeholder'));
						}
					}).blur().parents('form').submit(function() {
				$(this).find('[placeholder]').each(function() {
					var input = $(this);
					if (input.val() == input.attr('placeholder')) {
						input.val('');
					}
				})
			});
		});
	</script>

</body>
</html>
