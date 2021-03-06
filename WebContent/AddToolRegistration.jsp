<!DOCTYPE html>

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
<!-- <link rel="stylesheet" type="text/css" href="css/demoForRegistration.css" /> -->
<link rel="stylesheet" type="text/css"
	href="css/styleForRegistration.css" />
<link rel="stylesheet" type="text/css"
	href="css/animate-customForRegistration.css" />

<script >
	function DisableRightClick() {
		if (event.button == 2) {
			alert("Right Click is not possible Here !")
		}

	}
	</script>
</head>

<body>

	<div class="wrapperForCenterOfthePage">

		<div class="AddNewtool">
			<div class="primary-nav" style="height: 0px; width: 1%"></div>
			<section class="bodySec">
				<a class="hiddenanchor" id="toregister"></a> <a class="hiddenanchor"
					id="tologin"></a>
				<div id="wrapper">
					<div id="ToolRegister" class="animate form">
						<form id="formTest" method="post" action="ALMToolServlet" autocomplete="off">
							<h1>ALM Tool Registration</h1>
							<p>
								<label for="toolName" class="toolname" data-icon="u">
									Tool Name </label> <input id="toolName" name="toolName"
									required="required" type="text" placeholder="Rally" />
							</p>
							<p>
								<label for="toolNickName" class="toolnickname" data-icon="u">
									Tool Nick Name </label> <input id="toolNickName" name="toolNickName"
									required="required" type="text" placeholder="MyRally" />
							</p>
							<p>
								<label for="toolUrl" class="toolUrl" data-icon="p"> Tool
									URL </label> <input id="toolUrl" name="toolUrl" required="required"
									type="text" placeholder="eg. http://rally1.rallydev.com/" />
							</p>
							<p>
								<label for="userName" class="userName" data-icon="u">
									Tool User Name </label> <input id="userName" name="userName"
									required="required" type="text"
									placeholder="user@company.com" />
							</p>
							<p>
								<label for="toolPassword" class="toolPassword" data-icon="p">
									Tool Password </label> <input id="txtPassword" name="password"
									required="required" type="password" placeholder="eg. X8df!90EO" />
							</p>
							<p>
								<label for="projectName" class="projectName" data-icon="u">
									Project Name </label> <input id="projectName" name="projectName"
									required="required" type="text" placeholder="AgileCOE" />
							</p>

							<p>
								<label for="workspaceName" class="workspaceName" data-icon="u">
									Workspace Name </label> <input id="workspaceName" name="workspaceName"
									required="required" type="text" placeholder="Workspace1" />
							</p>


							<div id="outer">
								<div class="inner">
									<button type="submit">Save</button>
								</div>
								<div class="inner">
									<button type="reset">Reset</button>
								</div>
								<div class="inner">
									<button class="msgBtnBack"
										onclick="location.href='Main_admin.jsp';">Back</button>
								</div>
							</div>


						</form>

					</div>
				</div>
			</section>
		</div>
	</div>
</body>

