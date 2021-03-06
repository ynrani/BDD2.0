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

<style>
#mainTable {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	width: 746px;
	border-collapse: collapse;
	margin-left: 170px;
}

#mainTable td, #mainTable th {
	font-size: 1em;
	border: 1px solid #98bf21;
	padding: 3px 7px 2px 7px;
}

#mainTable th {
	font-size: 1.1em;
	text-align: left;
	padding-top: 3px;
	padding-bottom: 2px;
}
</style>
<head>

<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/custom.css">
<link rel="stylesheet" type="text/css" href="css/demo.css" />
<link rel="stylesheet" type="text/css" href="css/style1.css" />
<link rel="stylesheet" type="text/css" href="css/animate-custom.css" />
<link rel="stylesheet" type="text/css" href="css/menu.css" />
<link rel="stylesheet" type="text/css" href="css/manuTab.css" />
<link rel="stylesheet" type="text/css" href="css/theme.default.css">
<link rel="stylesheet" type="text/css" href="css/stylesNew.css">
<link rel="stylesheet" type="text/css" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/DropDown.css">

<!-- <link rel="stylesheet" type="text/css" href="css/dropdemo.css"> -->

<link rel="stylesheet" type="text/css" href="css/button.css" />
<link rel="stylesheet" type="text/css" href="css/radio1.css" />
<link rel="stylesheet" type="text/css" href="css/table.css" />
<link rel="stylesheet" type="text/css" href="css/TextArea.css" />

<!-- these css are for footer -->

<link rel="stylesheet" href="css/footer-distributed.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
<link href="http://fonts.googleapis.com/css?family=Cookie"
	rel="stylesheet" type="text/css">

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
<script src="//code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript" src="js/jquery-1.2.3.min.js"></script>
<script type="text/javascript" src="js/jquery.easing.min.js"></script>
<script type="text/javascript" src="js/jquery.lavalamp.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.js"></script>
<script src="js/modernizr.custom.js"></script>

<title>Build Feature</title>
<script type="text/javascript">

var res1;
	function evalGroup(selected_value) {

		var strUser = selected_value
		var parameter = "fromPage=CreateFileNewUI.jsp";
		parameter=parameter +"&userstoryName=" + selected_value;	
		parameter=parameter +"&operation=preview" ;	
		$.ajax({
			url : "b.html?",
			type : "POST",
			data : parameter,
			async : false,
			success : function(result) {

				// $("#DemandFilename1").empty();	                    
				document.getElementById("DemandFilename1").innerHTML = result;
				//alert(document.getElementById("DemandFilename1").innerHTML)
				//alert(result);
				res1 = removeTags(result);
				//alert(res1);

				//alert("Hello " + removeTags(result));
			}
		});

		//srs		}
		//sr	}
		return true;
	}

	function removeTags(result) {
		if (result.charAt(0) == '"' && result.charAt(result.length - 1) == '~'
				&& result.charAt(result.length - 2) == '"') {
			result = result.substring(1, result.length - 2);
		} else if (result.charAt(0) == '"') {
			result = result.substring(1);
		}

		result = result.split('<div>').join('');
		result = result.split('&nbsp;').join(' ');
		result = result.split('</div>').join('\n');
		result = result.split('\\"').join('"');
		result = result.split('<br />').join('\n');
		//alert(result);
		return result;
	}

	function CmdAdd_onclick() {
		toolNickName = document.getElementById("ToolList").options[document
		             .getElementById("ToolList").selectedIndex].innerHTML;
		userstoryName = document.getElementById("FList").options[document
				.getElementById("FList").selectedIndex].innerHTML;
		releaseName = document.getElementById("RelList").options[document
				.getElementById("RelList").selectedIndex].innerHTML;
		iterationName = document.getElementById("ItrList").options[document
				.getElementById("ItrList").selectedIndex].innerHTML;
		

		var parameter = "toolNickName=" + toolNickName;
		parameter=parameter +"&fromPage=CreateFileNewUI.jsp";
		parameter=parameter +"&releaseName=" + releaseName;	
		parameter=parameter +"&iterationName=" + iterationName;
		parameter=parameter +"&userstoryName=" + userstoryName;	
		parameter=parameter +"&operation=search" ;	
		
		$.ajax({
					url : "b.html",
					type : "POST",
					data :  parameter,
					async : true,
					success : function(result) {
						var newTable, startTag, endTag;
						startTag = "<TABLE id='mainTable' BORDER='0' ><TBODY>";
						startTag = "<TBODY>";
						endTag = "</TBODY></TABLE>";
						endTag = "</TBODY>";
						newTable = startTag;
						//alert(result);
						var featureListArray = result.split('~');

						newTable = newTable + ('<TR>');
						newTable = newTable
								+ ('<TD ><b><font face="Times New Roman" size="2">User Story ID</font></b></TD>');
						newTable = newTable
								+ ('<TD ><b><font face="Times New Roman" size="2">User Story  Summary</font></b></TD>');
						newTable = newTable
								+ ('<TD ><b><font face="Times New Roman" size="2">User Story Description</font></b></TD>');
						newTable = newTable
								+ ('<TD ><b><font face="Times New Roman" size="2">Preview Story</font></b></TD>');
						newTable = newTable + '</TR>';
						//alert(featureListArray.length);
						//alert(featureListArray[0]);
						for (var i = 0; i < featureListArray.length; i++) {
							//alert(featureListArray[i]);
							var featureListArrayInternal = featureListArray[i].split(':');
							//alert(featureListArrayInternal.length);
							if (featureListArrayInternal[2] == "No") {
								newTable = newTable + ('<TR>');
								newTable = newTable
										+ ('<TD><font face="Times New Roman" size="2">'
												+ featureListArrayInternal[0] + ' </font></TD>');
								newTable = newTable
										+ ('<TD><font face="Times New Roman" size="2">'
												+ featureListArrayInternal[1]
														.substring(0, 25) + '... </font></TD>');
								newTable = newTable
										+ ('<TD><font face="Times New Roman" size="2">'
												+ featureListArrayInternal[3]
														.substring(0, 24) + '... </font></TD>');
								//srs        	 		newTable = newTable + ('<TD><input id='+featureListArrayInternal[0]+' type="radio" name="Demand" value='+featureListArrayInternal[1]+' onclick="evalGroup();SetName();" ></input></TD>');
								newTable = newTable
										+ ('<TD><input id='
												+ featureListArrayInternal[0]
												+ ' type="radio" name="Demand"  value="'
												+ featureListArrayInternal[1]
												+ '" onclick="evalGroup(\''
												+ featureListArrayInternal[1] + '\');SetName();"></input></TD>');
								newTable = newTable + '</TR>';
							} else {
								newTable = newTable + ('<TR>');
								newTable = newTable
										+ ('<TD bgcolor="#36b0b6"><font face="Times New Roman" size="2">'
												+ featureListArrayInternal[0] + ' </font></TD>');
								newTable = newTable
										+ ('<TD bgcolor="#36b0b6"><font face="Times New Roman" size="2">'
												+ featureListArrayInternal[1]
														.substring(0, 25) + ' </font></TD>');
								newTable = newTable
										+ ('<TD bgcolor="#36b0b6"><font face="Times New Roman" size="2">'
												+ featureListArrayInternal[3]
														.substring(0, 24) + ' </font></TD>');
								newTable = newTable
										+ ('<TD bgcolor="#36b0b6"><input id='
												+ featureListArrayInternal[0]
												+ ' type="radio"  name="Demand" value='
												+ featureListArrayInternal[1] + ' onclick="evalGroup();SetName();" ></input></TD>');
								newTable = newTable + '</TR>';
							}

						}
						//newTable = newTable + ('<TR><TD><input type="button" id="DD13" class="button" value="Save" onclick="return SaveDetails_onclick()"/></TD></TR>');
						newTable = newTable + endTag
						//alert(document.getElementById('mainTable').innerHTML);
						document.getElementById('mainTable').innerHTML = newTable;
					}
				});
	}

	function checkSubmit() {
		//document.getElementById("Status").style.visibility="visible";

		//alert("${submitDone}")

		alert("Data submitted successfully")
	}

	function DisableRightClick() {
		if (event.button == 2) {
			alert("Right Click is not possible Here !")
		}

	}
	//srs   document.onmousedown=DisableRightClick;

	$(function() {
		$("#1, #2, #3").lavaLamp({
			fx : "backout",
			speed : 700,
			click : function(event, menuItem) {
				return false;
			}
		});
	});

	function SetName() {
		//alert(2);
		var toolNickName = document.getElementById("ToolList").options[document
		                   .getElementById("ToolList").selectedIndex].innerHTML;
		var Release = document.getElementById("RelList").options[document
				.getElementById("RelList").selectedIndex].innerHTML;
		////alert(Release)
		var IterationName = document.getElementById("ItrList").options[document
				.getElementById("ItrList").selectedIndex].innerHTML;
		//alert(IterationName)
		var Feature = document.getElementById("FList").options[document
				.getElementById("FList").selectedIndex].innerHTML;
		//alert(Feature)
		var Demand = $("input[name='Demand']:checked").val();
		//alert( document.getElementById("DemandFilename1").innerHTML)
		//alert(Demand);
		//alert( res1);
		var DemandDetails = res1;
		var toolName='';
		<%
		Common_Runtime cmrt = new Common_Runtime();
		String temptoolName="";
		try {
			cmrt.connectToDatabase();
			String toolNickName = request.getParameter("ToolList");
			String sql = "SELECT ToolName  FROM mysqlbdd.almtool where ToolNickName = '"+ toolNickName + "';";
			ResultSet res = cmrt.executeQuery(sql);
			while (res.next())
				temptoolName = res.getString("ToolName");
			if(temptoolName != null && !temptoolName.isEmpty()){
				%>
				toolName = <%=temptoolName%>;
				<%
			}
				
		}
		catch(Exception e){
			e.printStackTrace();
		}
		%>
		
		<%-- if(<%=temptoolName%> != '' && <%=temptoolName%> != undefined) --%>
		<%-- toolName = <%=temptoolName%>; --%>
		//alert( DemandDetails)
		var DemandStryText = "@Tool:" + toolName + "\n";
		DemandStryText = DemandStryText + "@Release:" + Release + "\n";
		DemandStryText = DemandStryText + "@Iteration:" + IterationName + "\n";
		//DemandStryText = DemandStryText + "Feature: " + Feature + "\n";
		DemandStryText = DemandStryText + "@UserStory Name : " + Demand + "\n";
		DemandStryText = DemandStryText + "@UserStory Description: " + DemandDetails;
		document.getElementById("DemandTXTArea").value = DemandStryText;
<%java.text.DateFormat df1 = new java.text.SimpleDateFormat("ddMMyyyyHHMMSS"); %>
	//srs    
	var test="";
				//document.getElementById("DemandFilename2").value = Demand + "_" +
<%=df1.format(new java.util.Date())%>
	+ ".txt"    
		document.getElementById("DemandFilename2").value = Demand
		//alert(Demand);
		//sre    
		document.getElementById("ReleaseName1").value = Release;
		document.getElementById("IterationName1").value = IterationName;
		document.getElementById("FeatureName1").value = Feature;
		document.getElementById("DemandStoryName1").value = Demand;
		document.getElementById("almtool1").value= toolNickName;
		//alert(DemandStryText);
	}



	function loadbody() {
		document.getElementById("Status").style.visibility = "hidden";
	}
	
	function fnOnChangeValue(selectedValue, param) {
			var detailFlag = true;
			var DemandStryText = "";
			var strValue = selectedValue.value;
			var toolName = document.getElementById("ToolList").options[document.getElementById("ToolList").selectedIndex].innerHTML;
			var id = "";
			var listArray;
			var Listbox0 = "#ToolList";
			var Listbox1 = "#RelList";
			var Listbox2 = "#ItrList";
			var Listbox3 = "#FList";
			var Listbox4  = "#DList";
			switch(param){
				case "tool":
				{
					id = 'almToolID';
					strValue = document.getElementById("ToolList").options[document.getElementById("ToolList").selectedIndex].innerHTML;
					var parameter = id + "=" + strValue;
					parameter=parameter +"&fromPage=CreateFileNewUI.jsp";
					parameter=parameter +"&populateList=release";
					//alert(parameter);
					$.ajax({
						url : "b.html?",
						type : "POST",
						data : parameter,
						async : true,
						success : function(result) {
							listArray = result.split('~');
							//check for list box load - result is empty - --rani
							$(Listbox1).empty();
							$(Listbox1).append('<option value='+0+'>All</option>');
							var optionVal=0;
							for (var i = 0; i < listArray.length - 1; i++) {
								optionVal=i+1;
								$(Listbox1).append('<option value='+optionVal+'>' + listArray[i] + '</option>');

							}

						}
					});
					//To populate the iteration dropdown
					parameter = id + "=" + strValue; 
					parameter=parameter +"&fromPage=CreateFileNewUI.jsp";
					parameter=parameter +"&populateList=iteration";
					$.ajax({
						url : "b.html?",
						type : "POST",
						data : parameter,
						async : true,
						success : function(result) {
							listArray = result.split('~');
							//check for list box load - result is empty - --rani
							$(Listbox2).empty();
							$(Listbox2).append('<option value='+0+'>All</option>');
							for (var i = 0; i < listArray.length - 1; i++) {
								$(Listbox2).append('<option value='+i+'>' + listArray[i] + '</option>');

							}

						}
					});
					//To Populate the feature dropwdown
					parameter = id + "=" + strValue;
					parameter=parameter +"&fromPage=CreateFileNewUI.jsp"; 
					parameter=parameter +"&populateList=feature";
					$.ajax({
						url : "b.html?",
						type : "POST",
						data : parameter,
						async : true,
						success : function(result) {
							listArray = result.split('~');
							//check for list box load - result is empty - --rani
							$(Listbox3).empty();
							$(Listbox3).append('<option value='+0+'>All</option>');
							for (var i = 0; i < listArray.length - 1; i++) {
								$(Listbox3).append('<option value='+i+'>' + listArray[i] + '</option>');

							}

						}
					});
					break;
				}
				case "release":
				{
					
					id = 'releaseId';
					strValue = document.getElementById("RelList").options[document.getElementById("RelList").selectedIndex].innerHTML;
					var parameter = id + "=" + strValue;
					parameter=parameter + "&almToolID="+toolName;
					parameter=parameter +"&fromPage=CreateFileNewUI.jsp";
					parameter=parameter +"&populateList=iteration";
					$.ajax({
						url : "b.html?",
						type : "POST",
						data : parameter,
						async : true,
						success : function(result) {
							listArray = result.split('~');
							//check for list box load - result is empty - --rani
							$(Listbox2).empty();
							$(Listbox2).append('<option value='+0+'>All</option>');
							for (var i = 0; i < listArray.length - 1; i++) {
								$(Listbox2).append('<option value='+i+'>' + listArray[i] + '</option>');

							}

						}
					});
					//Populate the features dropdown
					/* id = 'iterationId'
					strValue = document.getElementById("ItrList").options[document.getElementById("ItrList").selectedIndex].innerHTML; */
					var parameter = id + "=" + strValue;
					parameter=parameter + "&almToolID="+toolName;
					parameter=parameter +"&fromPage=CreateFileNewUI.jsp";
					parameter=parameter +"&populateList=feature";
					$.ajax({
						url : "b.html?",
						type : "POST",
						data : parameter,
						async : true,
						success : function(result) {
							listArray = result.split('~');
							//check for list box load - result is empty - --rani
							$(Listbox3).empty();
							$(Listbox3).append('<option value='+0+'>All</option>');
							for (var i = 0; i < listArray.length - 1; i++) {
								$(Listbox3).append('<option value='+i+'>' + listArray[i] + '</option>');

							}

						}
					});
					break;
				}
				case "iteration":
				{
					id = 'iterationId'
					strValue = document.getElementById("ItrList").options[document.getElementById("ItrList").selectedIndex].innerHTML;
					var parameter = id + "=" + strValue;
					parameter=parameter + "&almToolID="+toolName;
					parameter=parameter +"&fromPage=CreateFileNewUI.jsp";
					parameter=parameter +"&populateList=feature";
					$.ajax({
						url : "b.html?",
						type : "POST",
						data : parameter,
						async : true,
						success : function(result) {
							listArray = result.split('~');
							//check for list box load - result is empty - --rani
							$(Listbox3).empty();
							$(Listbox3).append('<option value='+0+'>All</option>');
							for (var i = 0; i < listArray.length - 1; i++) {
								$(Listbox3).append('<option value='+i+'>' + listArray[i] + '</option>');

							}

						}
					});
					/* id = 'featureId';
					strValue = document.getElementById("FList").options[document.getElementById("FList").selectedIndex].innerHTML;
					var parameter = id + "=" + strValue;
					parameter=parameter +"&fromPage=CreateFileNewUI.jsp";
					parameter=parameter +"&populateList=feature";
					$.ajax({
						url : "b.html?",
						type : "POST",
						data : parameter,
						async : true,
						success : function(result) {
							listArray = result.split('~');
							//check for list box load - result is empty - --rani
							$(Listbox4).empty();
							$(Listbox4).append('<option value='+0+'>All</option>');
							for (var i = 0; i < listArray.length - 1; i++) {
								$(Listbox4).append('<option value='+i+'>' + listArray[i] + '</option>');

							}

						}
					}); */
					break;
				}
				case "feature":
				{
					id = 'featureId';
					strValue = document.getElementById("FList").options[document.getElementById("FList").selectedIndex].innerHTML;
					var parameter = id + "=" + strValue;
					parameter=parameter + "&almToolID="+toolName;
					parameter=parameter +"&fromPage=CreateFileNewUI.jsp";
					$.ajax({
						url : "b.html?",
						type : "POST",
						data : parameter,
						async : true,
						success : function(result) {
							listArray = result.split('~');
							//check for list box load - result is empty - --rani
							$(Listbox4).empty();
							$(Listbox4).append('<option value='+0+'>All</option>');
							for (var i = 0; i < listArray.length - 1; i++) {
								$(Listbox4).append('<option value='+i+'>' + listArray[i] + '</option>');

							}

						}
					});
					break;
				}
				case "demand":
				{
					id = 'featureId';
					strValue = document.getElementById("DList").options[document.getElementById("DList").selectedIndex].innerHTML;
					var parameter = id + "=" + strValue;
					parameter=parameter + "&almToolID="+toolName;
					parameter=parameter +"&fromPage=CreateFileNewUI.jsp";
					$.ajax({
						url : "b.html?",
						type : "POST",
						data : parameter,
						async : true,
						success : function(result) {
							listArray = result.split('~');
							//check for list box load - result is empty - --rani
							$(Listbox4).empty();
							for (var i = 0; i < listArray.length - 1; i++) {
								$(Listbox4).append('<option value='+i+'>' + listArray[i] + '</option>');

							}

						}
					});
					break;
				}
			}


			}
	
		
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



<body>

	<div class="wrapperForCenterOfthePage">

		<div class="mainAll">


			<%
				if (session.getAttribute("ADMINFLAG") != null
						|| (!session.getAttribute("ADMINFLAG").equals(""))) {

					boolean isAdmin = (Boolean) session.getAttribute("ADMINFLAG");
					if (isAdmin) {
			%>
			<jsp:include page="Top_admin.jsp"></jsp:include>
			<%
				}

					else {
			%>
			<jsp:include page="Top_user.jsp"></jsp:include>
			<%
				}
			%>

			<%
				}
			%>

			<div class="primary-nav"></div>

			<br> <br> <br> <br> <br> <br>

			<section class="bodySec">
			<div class="container tdm-central"
				style="margin-bottom: 6.2%; overflow: hidden;">
				<jsp:include page="createNewUIInclude.jsp"></jsp:include>

				<br> <br> <br> <br> <br> <br> <br>
				<br> <br> <br> <br>
			</div>

			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br>
			<br>


			</section>

			<!-- <script src="include/footer.js"></script> -->
		</div>

	</div>
	<div class="footerDivToStickToBottom">

		<jsp:include page="Footer.jsp"></jsp:include>

	</div>

	<!-- <script src="js/DropDown.js"></script> -->

</body>

</html>