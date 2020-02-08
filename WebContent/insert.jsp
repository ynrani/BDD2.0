



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
<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">  -->
<title>User Registration</title>
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
	<div class="container">
		<!-- Codrops top bar -->


		<section>
			<div id="container_demo">
				<!-- hidden anchor to stop jump http://www.css3create.com/Astuce-Empecher-le-scroll-avec-l-utilisation-de-target#wrap4  -->
				<a class="hiddenanchor" id="toregister"></a> <a class="hiddenanchor"
					id="tologin"></a>
				<div id="wrapper">
					<div id="login" class="animate form">
						<form id="formTest" method="post" action="insertdb.jsp"
							autocomplete="on">
							<h1>User Registration</h1>
							<p>
								<label for="txtName" class="uname" data-icon="u"> Your
									username </label> <input id="txtName" name="UserName"
									required="required" type="text"
									placeholder="myusername or mymail@mail.com" />
							</p>
							<p>
								<label for="txtPassword" class="youpasswd" data-icon="p">
									Your password </label> <input id="txtPassword" name="UserPassword"
									required="required" type="password" placeholder="eg. X8df!90EO" />
							</p>



							<p>
								<label for="adminFlagID" class="uname" data-icon="u">
									User Type </label> <input id="userType" name="UserType"
									required="required" type="text" placeholder="eg. admin, manager, user" />
							</p>

							<div id="outer">
								<div class="inner">
									<button type="submit" name="save">Save</button>
								</div>
								<div class="inner">
									<button type="reset" name="reset">Reset</button>
								</div>
								<div class="inner">
									<button class="msgBtnBack" name="back"
										onclick="location.href='Main_admin.jsp';">Back</button>
								</div>
							</div>


						</form>
					</div>
				</div>
			</div>
		</section>
	</div>
</body>
</html>
