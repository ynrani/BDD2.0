<!doctype html>
<%@page import="com.cg.bdd.properties.BDDPropertyConstant"%>
<%@page import="com.cg.bdd.servlet.LoginServlet"%>
<html>
<head>
<title>Agile BDD world</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
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

<script type="text/javascript" src="js/html5.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.tablesorter.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
<script type="text/javascript" src="js/main.js"></script>
<script type="text/javascript" src="js/jquery.validate.min.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<body>
	<div class="mainAll">
		<script src="include/loginHeader.js"></script>
		<section class="bodySec">
			<div class="login-bg2">
				<div id="container_demo">
					<div id="wrapper">
						<div id="login" class="animate form">
							<div align="center" style="color: #886EFE">
								<%
									if (request.getAttribute("error") != null) {
										String login_msg = (String) request.getAttribute("error");
										if (login_msg != null)
											out.println(login_msg);
									}

									else if (request
											.getAttribute("successfully_logged_out_message_key") != null) {
										String log_out_message = (String) request
												.getAttribute("successfully_logged_out_message_key");
										if (log_out_message != null)
											out.println(log_out_message);
									}

									else if (request.getParameter("session") != null
											&& request.getParameter("session").equals("expired")) {
										out.println("Session Expired");
									} else if (request.getAttribute("alreadyLogged_message_key") != null) {
										String userIsalreadyLoggedMessage = (String) request
												.getAttribute("alreadyLogged_message_key");
										if (userIsalreadyLoggedMessage != null)
											out.println(userIsalreadyLoggedMessage);
									} else if (request.getAttribute("userIsNotLoggedIn") != null) {
										String userIsNotLoggedIn = (String) request
												.getAttribute("userIsNotLoggedIn");
										if (userIsNotLoggedIn != null)
											out.println(userIsNotLoggedIn);
									}
								%>
								<b
									style="font-size: 11px; color: #ED2121; padding: 4% 0% 0% 0%;">

								</b>
							</div>
							<form id="loginForm" name="loginForm" action="LoginServlet"
								method="post" autocomplete="on">
								<h1>Log in</h1>
								<p>
									<label for="username" class="uname" data-icon="u">
										Username </label> <input id="userid" name="uname" required="required"
										type="text" placeholder="User ID" class="fontClass" />
								</p>
								<p>
									<label for="password" class="youpasswd" data-icon="p">
										Password </label> <input id="password" name="pass" required="required"
										type="password" placeholder="Password" class="fontClass" />
								</p>
								<p class="login button">
									<input type="submit" value="Login" />
								</p>

							</form>
						</div>
					</div>
				</div>
				<div class="clearfloat">&nbsp;</div>
			</div>

		</section>

	</div>
	<script type="text/javascript">
		loginValidation();

		window.history.forward();
		function noBack() {
			window.history.forward();
		}

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