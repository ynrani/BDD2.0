<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.ListIterator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@ page import="java.io.*,java.util.*"%>
<%@ page import="javax.servlet.*,java.text.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.cg.bdd.common.Common_Runtime"%>
<html>
<head>
<!-- these css are for footer -->

<link rel="stylesheet" href="css/footer-distributed.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
<link href="http://fonts.googleapis.com/css?family=Cookie"
	rel="stylesheet" type="text/css">

<meta charset="UTF-8">
<title>Setting Page</title>
<link rel="stylesheet" href="css/normalize.css">

<style>
/* NOTE: The styles were added inline because Prefixfree needs access to your styles and they must be inlined if they are on local disk! */
@import
	url(http://fonts.googleapis.com/css?family=Open+Sans:400,700,600,300,800)
	;
</style>
<script src="js/prefixfree.min.js"></script>
<script type="text/javascript">
 function checkSubmit()
 {
 	//alert("Data configured successfully")
 }

 function SetName(){
		//alert("Another test for SetName");
		var test=document.getElementById("CreateStepDefinitions").checked;
		/* if (document.getElementById("CreateStepDefinitions").checked)
		{
			alert("checked "+ document.getElementById("CreateStepDefinitions").checked);
			test=document.getElementById("CreateStepDefinitions").checked;
			document.getElementById("createStepDefHid").value= test;//true;
			alert("createStepDefHid : "+ document.getElementById("createStepDefHid").value);
			
		}
		else
		{
			alert("not checked "+ document.getElementById("CreateStepDefinitions").checked);
			document.getElementById("createStepDefHid").value=false;
		} */
		document.getElementById("createStepDefHid").value= test;
		alert(1);
		alert("createStepDefHid : "+ document.getElementById("createStepDefHid").value);
	    var toolNickName = document.getElementById("ToolList").options[document.getElementById("ToolList").selectedIndex].innerHTML;	
	    document.getElementById("toolnickname").value = toolNickName;
	}


function loadbody(){
	document.getElementById("Status").style.visibility="hidden";
}
</script>

</head>
<body onload="loadbody()">

	<div class="wrapperForCenterOfthePage">

			<section class="bodySec"> 
			<a class="hiddenanchor"	id="toregister"></a> <a class="hiddenanchor" id="tologin"></a>
			<div id="wrapper">

<!-- action="GenerateFeatureFilesServlet" -->
					<form name="GenerateFeatureFiles" method="post" action="GenerateFeatureFiles"
						onsubmit="checkSubmit();">

						<% Common_Runtime cmrt= new Common_Runtime();
							try {
								cmrt.connectToDatabase();
								
								String sql = "SELECT ToolNickName  FROM mysqlbdd.almtool";
								ResultSet res = cmrt.executeQuery(sql);
							%>
						<table style="margin-left: 235px; margin-bottom: 40px; width: 746px; height: 80px;">
						<tbody>
						<tr><td></td><td></td><td></td></tr>
						<TR>
							<TD width="7%" style="font-weight: bold;" align="Justify">&nbsp;&nbsp;&nbsp;&nbsp;ALMTool</TD>
							<TD width="7%" style="font-weight: bold;"></TD>
							<TD width ="7%"style="font-weight: bold;"></TD>
							
						</TR>
							<tr>
								<td width="7%"><select style="width: 170px; margin-left: 13px;"
									name="ToolList" id="ToolList" class="form-control select">
									<!-- onchange="fnOnChangeRelease(this,'tool');"> -->
										<option value="All">--Please select--</option>
										<%
												while (res.next()) {
														String tname = res.getString("ToolNickName");
											%>
										<option value="<%=tname%>"><%=tname%></option>
										<%
											}
												} catch (SQLException sqe) {
													out.println(sqe);
												}
											%>
								</select></td>
								<td width="4%">
									<input type="checkbox" name="CreateStepDefinitions" id="CreateStepDefinitions">
									Generate Step Definitions
									<input type="hidden" name="myhid" class="balloon" value="">
									<input type="hidden" name="createStepDefHid" class="balloon" value="">
								</td>
								<td width="7%"> <input
										class="button" type="submit" name="GenerateFeatures"
										id="GenerateFeatures" value="Generate Features" onClick = "SetName()" /></a>
										 <input type="hidden" name="toolnickname"
										class="balloon" value="">
										</td>
							</tr>
							<tr><td></td><td></td><td></td></tr>
							</tbody>
						</table>

					</form>

					<br> <br> <br> <br> <br> <br> <br>
					<br> <br> <br> <br> <br>

				</div>

				<br /> <br /> <br /> <br />
			</section>


		</div>

	</div>


</body>

</html>