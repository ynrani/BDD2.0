<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.ListIterator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@ page import="java.io.*,java.util.*"%>
<%@ page import="javax.servlet.*,java.text.*"%>
<%@ page import="java.sql.*"%>

<%@page import="java.util.ListIterator"%>

<%@page import="java.util.List"%>
<%@ page import="com.cg.bdd.file.utils.FileUtility"%>
<%@ page import="com.cg.bdd.common.Common_Runtime"%>

<html>
<style>
#mainTable {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	width: 746px;
	border-collapse: collapse;
	margin-left: 75px;
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
<link rel="stylesheet" type="text/css" href="css/theme.default.css">
<link rel="stylesheet" type="text/css" href="css/stylesNew.css">
<link rel="stylesheet" type="text/css" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/DropDown.css">
<link rel="stylesheet" type="text/css" href="css/button.css" />
<link rel="stylesheet" type="text/css" href="css/radio1.css" />
<link rel="stylesheet" type="text/css" href="css/table.css" />
<link rel="stylesheet" type="text/css" href="css/TextArea.css" />
<link rel="stylesheet" type="text/css" href="css/abc.css" />

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
<!-- <script src="//code.jquery.com/jquery-2.1.4.min.js"></script> -->
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="js/jquery.easing.min.js"></script>
<script type="text/javascript" src="js/jquery.lavalamp.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.js"></script>
<script src="js/modernizr.custom.js"></script>

<title>Edit Feature</title>

<script>

function checkSubmit()
{
	alert("Data updated successfully")
}


function DisableRightClick() 
{
   if (event.button == 2) 
    {
     alert("Right Click is not possible Here !")
    }
    
 }
    document.onmousedown=DisableRightClick;

$(function() {
    $("#1, #2, #3").lavaLamp({
        fx: "backout",
        speed: 700,
        click: function(event, menuItem) {
            return false;
        }
    });
});

	<%Common_Runtime cmrt = new Common_Runtime();%>
	var location1='<%=cmrt.m_featurePath.replace("\\","\\\\")%>';
	function evalGroup() {
		var group = document.OpenFile.Demand;
		var strSelection = document.getElementById("FolderList").options[document
				.getElementById("FolderList").selectedIndex].innerHTML;
		var strTool = document.getElementById("ToolList").options[document
		                                            				.getElementById("ToolList").selectedIndex].innerHTML;
		if (strSelection == "All")
			strSelection = strTool;	
		else
			strSelection = strTool + "\\" + strSelection;
		//alert(group.length);
		for (var i = 0; i < group.length; i++) {
			if (group[i].checked) {
				var selected_value = $("input[name='Demand']:checked").val()+ '';
				//alert(selected_value)
				
			}	//strSelection = selected_value ;
				else
				{	
				//alert(strSelection)
				//var strSelection = selected_value					 
				var id = "featureId1";
				var parameter = id + "=" + strSelection;
	   			parameter = parameter + "&fromPage=OpenFile.jsp";
				$
						.ajax({
							url : "a.html?",
							type : "POST",
							data : parameter,
							async : true,
							success : function(result) {
								$("#FileName").empty();
								var featureListArray = result.split('~');
								document.getElementById("FileName").value = featureListArray[0];
								//alert(document.getElementById("FileName").value);				                    
								res1 = result;
								//alert(res1);
							}
						});
			} 
		}
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

				<form name="OpenFile" action="EditFeatureFileServlet" method="post">
					<!-- <form name="Prentform2" action="#" method="post" > -->
					<TABLE
						style="margin-left: 170px; margin-bottom: 40px; width: 746px; height: 80px;">

						<tr>

						</tr>
						<TR>
							<TD width="7%" style="font-weight: bold;">ALMTool</TD>
							<TD width="7%" style="font-weight: bold;">Features</TD>
							<TD style="font-weight: bold;"></TD>
							<TD style="font-weight: bold;"></TD>
						</TR>

						<TR>
							<TD>
								<div class="dropdown">
									<p>
										<font face="Calibri" color="green"></font> <select
											style="width: 170px; margin-left: 13px;" id="ToolList"
											class="form-control select" name="ToolList"
											onchange="fnOnChangeFolder(this,'Folder');">
											<option value="All">Please select</option>
											<%
												cmrt = new Common_Runtime();
												try {
													cmrt.connectToDatabase();
													
													String sql = "SELECT ToolNickName FROM mysqlbdd.almtool";
													ResultSet res = cmrt.executeQuery(sql);
													int size=0;
													while (res.next()) {
													    size++;
													}
												
												System.out.println("query is " + sql);
												System.out.println("Size "+ size);
												res.beforeFirst();
													while (res.next()) {
															String toolnickname = res.getString("ToolNickName");
															System.out.println("ToolNickName " + toolnickname);	
												%>
											<option value="<%=toolnickname%>">
												<%=toolnickname%>
											</option>
											<%
													}
											} catch (SQLException sqe) {
												out.println(sqe);
											}
											%>
										</select>
									</p>
								</div>
							</TD>
							<TD>
								<div class="dropdown">
									<p>
										<font face="Calibri" color="green"></font> <select
											style="width: 170px; margin-left: 13px;" id="FolderList"
											class="form-control select" name="FolderList">
											<!-- onchange="fnOnChangeFolder(this,'SubFolder');"> -->
											<option value="All">All</option>
										</select>
									</p>
								</div>
							</TD>

							<TD><input type="button"
								style="width: 170px; margin-left: 50px;" id="DD12"
								class="button" value="Search Story" onclick="CmdAdd_onclick()" /></TD>
							<TD> </TD>
						</TR>
						<TR>
							<table id="mainTable"
								style="margin-left: 170px; margin-bottom: 40px; width: 753px;">
								<tr style="width: 120px"></tr>
							</table>
						</TR>
						<tr>
							<br>
							<br>
							<br>
						</tr>
						<!-- style="width: 450px; height: 150px;"  -->
						<tr style="width: 120px">
							<textarea name="DemandTXTArea12" id="DemandTXTArea12"  style="width: 746px; height: 150px; margin-right: 115px;" onFocus="parent_disable();"
								onclick="parent_disable();">
							Selected user story will appear here...
						</textarea>
						</tr>
						<tr>
							<br>
							<br>
						</tr>
						<tr>
							<input type="checkbox" name="editToALMTool" id ="editToALMTool" > <label for="editToALMTool">Please select the checkbox if you want to update the selected feature in ALMTool</label>
						</tr>
						<tr>
							<br>
						</tr>
					</table>
					<br />
					<!-- <BR/><input type="button" class="button" value="Save"  /> -->
					<input type="hidden" id="Folder1" name="Folder1" value="" /> <input
						type="hidden" id="SubFolder1" name="SubFolder1" value="" /> <input
						type="hidden" id="FileName1" name="FileName1" value="" /> <input
						type="hidden" id="FileName" name="FileName" value="" /> <input
						type="hidden" id="DemandDetails1" name="DemandDetails1" value="" />
						<input type="hidden" id="FromPage" name="FromPage" value="OpenFile.jsp" /> 
					<input type="hidden" id="FileLocationPath" name="DemandDetails2" value=""/> 
						<input type="hidden" id="SelectedALMTool" name="SelectedALMTool" value=""/>
						<input type="hidden" id="UpdateToALMTool" name="UpdateToALMTool" value=""/>
						<input type="submit" class="button"
						value="Update Feature file" align="middle" style="margin-right: 1px;" onClick="SetName();" />
						<!-- <input type="submit" class="button"
						value="Update Tool & Feature file" align="middle" style="margin-right: 1px;" onClick="SetName();" /> -->
					<input type="reset" class="button" value="Reset" align="middle" style="margin-right: 150px;" onClick="window.location.reload();"/>
				</form>
				<br> <br> <br> <br> <br> <br> <br>
				<br> <br> <br> <br> <br>

			</div>

			<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br> <br>

			<!-- </section> -->

			<script src="include/footer.js"></script>
		</div>

	</div>

	<div class="footerDivToStickToBottom">

		<jsp:include page="Footer.jsp"></jsp:include>

	</div>

	<!-- <script src="js/DropDown.js"></script> -->
	<script>
	function fnOnChangeFolder(selectedValue, param) {
		//alert(param);
		var detailFlag = true;
		var DemandStryText = "";
		var strTool = document.getElementById("ToolList").options[document.getElementById("ToolList").selectedIndex].innerHTML;
		var strSelection = document.getElementById("FolderList").options[document.getElementById("FolderList").selectedIndex].innerHTML;
		strSelection = selectedValue.value;
		if (param == "Folder") {
			//alert(param);
			var strSelection = selectedValue.value;
			var id = "almToolID";
			var Listbox1 = "#FolderList";
		}
		var parameter = id + "=" + strSelection;
			parameter = parameter + "&fromPage=OpenFile.jsp";
		$.ajax({
			url : "a.html?",
			type : "POST",
			data : parameter,
			async : true,
			success : function(result) {
				var cnt = result.search('~');
				$(Listbox1).empty();
				$(Listbox1).append('<option value=-1>All</option>');
				if (cnt>0)	
				{
					var featureListArray = result.split('~');
					for (var i = 0; i < featureListArray.length ; i++) {
						//alert(featureListArray[i]);
						$(Listbox1).append('<option value='+i+'>' + featureListArray[i]	+ '</option>');
	
					}
				}
				else
					{
					$(Listbox1).append('<option value="1">' + result	+ '</option>');
					}

			}
		});

	}
	
	function CmdAdd_onclick() {
		var strSelection = document.getElementById("FolderList").options[document.getElementById("FolderList").selectedIndex].innerHTML;
		var strTool =  document.getElementById("ToolList").options[document.getElementById("ToolList").selectedIndex].innerHTML;
		var id = "folderId";
		var parameter = "";
		if (strSelection == "All")
		{
			strSelection = "features";
			 parameter = id + "=" + "\\AutomationFramework\\src\\test\\resources\\" + strSelection;
		}
		else
		{
			parameter = id + "=" + "\\AutomationFramework\\src\\test\\resources\\features\\" + strSelection;
		}
		parameter = parameter + "&almToolID=" + strTool;
		parameter = parameter + "&fromPage=OpenFile.jsp";
		$.ajax({
					url : "a.html",
					type : "POST",
					data: parameter,
					async : true,
					success : function(result) {
						var newTable, startTag, endTag;
						startTag = "<TABLE id='mainTable' BORDER='0'><TBODY>";
						endTag = "</TBODY></TABLE>";
						newTable = startTag;
						var featureListArray = result.split('~');
						//alert("featureList Array lenght " + featureListArray.length);
						newTable = newTable + ("<TR style='width: 120px'>");
						newTable = newTable
								+ ('<TD><b><font face="Times New Roman" size="2">Sr. No</font></b></TD>');
						newTable = newTable
								+ ('<TD><b><font face="Times New Roman" size="2">User Story Name</font></b></TD>');
						newTable = newTable
								+ ('<TD><b><font face="Times New Roman" size="2">Preview Story</font></b></TD>');
						newTable = newTable + '</TR>';
						for (var i = 0; i < featureListArray.length; i++) {
							{
								
								newTable = newTable + ('<TR>');
								newTable = newTable
										+ ('<TD><font face="Times New Roman" size="2">'
												+ (i + 1) + ' </font></TD>');
								newTable = newTable
										+ ('<TD><font face="Times New Roman" size="2">'
												+ featureListArray[i]
														.substring(0, 25) + ' </font></TD>');
								newTable = newTable
										+ ('<TD><input id="'
												+ featureListArray[i]
												+ '" type="radio" name="Demand" class="toggle1" value="'
												+ featureListArray[i] + '" onclick=fnOnSelectRadioButton();></input></TD>');
								newTable = newTable + '</TR>';
							}

						}
						//newTable = newTable + ('<TR><TD><input type="button" id="DD13" class="button" value="Save" onclick="return SaveDetails_onclick()"/></TD></TR>');
						newTable = newTable + endTag
						document.getElementById('mainTable').innerHTML = newTable;
					}
				});
	}
	
	function fnOnSelectRadioButton() {
		/* 	alert(document.getElementById("FolderList").options[document
			                                					.getElementById("FolderList").selectedIndex].innerHTML ); */
			strSelection = document.getElementById("FolderList").options[document
					.getElementById("FolderList").selectedIndex].innerHTML;
			var strTool = document.getElementById("ToolList").options[document
			                                    					.getElementById("ToolList").selectedIndex].innerHTML;
			if (strTool!= null)
				strTool = strTool.trim();
			if (strSelection == "All")
				strSelection = "features";
			//alert($("input[name='Demand']:checked").val());
			var path = '<%=cmrt.m_featurePath.replace("\\","\\\\")%>';
			//alert(path);
			path = path + "\\" + strTool + "\\AutomationFramework\\src\\test\\resources\\features\\";
			path = path + "\\" + $("input[name='Demand']:checked").val() + "\\" + $("input[name='Demand']:checked").val() + ".feature";

		//	path = path + "\\" + document.getElementById("FileName").value;
			//alert("me "+document.getElementById("FileName").value);
			//path = "file:///" + path
			//alert(path);
			id = "txtId"
				var parameter = id + "=" + path;
   			parameter = parameter + "&fromPage=OpenFile.jsp";
			$.ajax({
				url : "a.html?",
				type : "POST",
				async : true,
				data : parameter,
				success : function(result) {
					//result=chkNewline(result);
					//alert(result)
					//document.getElementById("DemandTXTArea12").value = result;  
					var featureListArray = result.split('@');
					document.getElementById("DemandTXTArea12").value = null;
					//$(Listbox1).append('<option value='+0+'>'+"Select Value sub folder"+'</option>');
					for (var i = 1; i < featureListArray.length; i++) {
						//$(Listbox1).append('<option value='+i+'>'+featureListArray[i]+'</option>');
						document.getElementById("DemandTXTArea12").value = document
								.getElementById("DemandTXTArea12").value
								+ "@" + featureListArray[i]; //+ "\n";
					}
					
				}
			});
			return evalGroup();
		}
	
	function SetName(){
		//alert("Another test for SetName");
	    var FolderName = document.getElementById("FolderList").options[document.getElementById("FolderList").selectedIndex].innerHTML;	
	   // alert("foldername "+FolderName);
		var SubFolderName = $("input[name='Demand']:checked").val();
		//alert("subfoldername "+SubFolderName);
		var FileName = $("input[name='Demand']:checked").val() + ".feature";	
		//alert("filename "+FileName);
		var DemandDetails = document.getElementById("DemandTXTArea12").value;
		//alert("DemandDetails "+DemandDetails);
		//alert(document.getElementById("ToolList").value);
		var SelectedALMTool = document.getElementById("ToolList").value;
		//alert("almtool "+ SelectedALMTool);
		var updatetoALMToolVal=document.getElementById("editToALMTool").checked;
	    document.getElementById("SubFolder1").value = SubFolderName;
	    document.getElementById("FileName1").value = FileName;
	    document.getElementById("DemandDetails1").value = DemandDetails;
	    document.getElementById("SelectedALMTool").value = SelectedALMTool;
	    document.getElementById("UpdateToALMTool").value=updatetoALMToolVal; 
	 /*    alert(document.getElementById("SelectedALMTool").value);
	    alert(document.getElementById("DemandDetails1").value);
	    alert(document.getElementById("SubFolder1").value);
	    alert(document.getElementById("FileName1").value); */
	}

	</script>
</body>
</html>