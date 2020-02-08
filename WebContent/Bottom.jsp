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
<title>Footer</title>
<link
	href="http://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/tool.css">

<!--[if lt IE 9]>
<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.js"></script>
<script type="text/javascript">

function DisableRightClick() 
{
   if (event.button == 2) 
    {
     alert("Right Click is not possible Here !")
    }
    
 }
//srs    document.onmousedown=DisableRightClick;
	
</script>

</head>

<body onFocus="parent_disable();" onclick="parent_disable();"">


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
