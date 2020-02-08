<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Demand Story Selection</title>
<script type="text/javascript">
	function setOptions(chosen) {
		var selbox = document.myform.form2;
		selbox.options.length = 0;
		if (chosen == "aaa") {
			selbox.options[selbox.options.length] = new Option("one",
					"firstoption");
		}
	}
</script>
</head>
<body>
	<form action="/example" method="post" focus="login" name="myform">
		<table>
			<tr>
				<td class="lbl" align="left">Name <select name="form1"
					onchange="setOptions(document.myform.form1.options[document.myform.form1.selectedIndex].value);">
						<option value="">--select--</option>
						<option value="aaa">aaa</option>
						<option value="">bbb</option>
				</select>
				</td>
				<td class="lbl" align="left">Id <select name="form2">
						<option value="">--select--</option>
				</select>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>