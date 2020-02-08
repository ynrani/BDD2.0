<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<!-- 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 -->

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
<style type="text/css">
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
	<div class="row">
		<form name="Prentform1" action="CreateFeatureFileServlet" method="post"
			onsubmit="checkSubmit();">
			<%-- <%
				Connection con = null;
				PreparedStatement ps = null;
				try {
					Class.forName(driverName);
					con = DriverManager.getConnection(url, user, psw);
					String sql = "SELECT DISTINCT R_name  FROM test.release";
					ps = con.prepareStatement(sql);
					ResultSet rs = ps.executeQuery();
			%> --%>
			<%
				Common_Runtime cmrt = new Common_Runtime();

				try {
					cmrt.connectToDatabase();

					String sql = "SELECT DISTINCT ToolNickName  FROM mysqlbdd.almtool";
					ResultSet res = cmrt.executeQuery(sql);
			%>
			<label for="Submit status" id="Status">${submitDone}</label>


			<table style="margin-left: 170px; margin-bottom: 40px; width: 746px; height: 80px;">

				<tr>
					<td style="font-weight: bold;">ALMTool</td>
					<td style="font-weight: bold;" > </td>
					<td style="font-weight: bold;"> </td>
					<td style="font-weight: bold;"> </td>
				</tr>
				<tr>

					<td>

						<div class="dropdown">
							<select style="width: 170px; margin-left: 13px;" name="ToolList" id="ToolList" class="form-control select" onchange="fnOnChangeValue(this,'tool')">
								<option value="">--Please select--</option>
								<%
									while (res.next()) {
											String rname = res.getString("ToolNickName");
								%>
								<option value="<%=rname%>"><%=rname%></option>
								<%
									}
								%>
							</select>
						</div>
					</td>
					<td style="font-weight: bold;" colspan=3> Please select the ALMTool to populate the Release, Iteration and Feature fields</td>
					<!-- <td></td>
					<td></td>
					<td></td> -->
				</tr>


				<tr>
					<td style="font-weight: bold;">Release</td>
					<td style="font-weight: bold;">Iteration</td>
					<td style="font-weight: bold;">Feature</td>
					<td style="font-weight: bold;">&nbsp;</td>

				</tr>
				
				<tr>

					<td>

						<div class="dropdown">
							<select style="width: 170px; margin-left: 13px;" name="RelList"
								id="RelList" class="form-control select"
								onchange="fnOnChangeValue(this,'release');">
								<option value="All">All</option>
								<%-- <%
								 sql = "SELECT DISTINCT ReleaseName  FROM mysqlbdd.bddrelease";
								res = cmrt.executeQuery(sql);
									while (res.next()) {
											String rname = res.getString("ReleaseName");
								%>
								<option value="<%=rname%>"><%=rname%></option>
								<%
									}
								%> --%>
							</select>
						</div>
					</td>


					<!-- ****************************this is selection -->

					<td>

						<div class="dropdown">



							<select style="width: 170px" name="ItrList" id="ItrList"
								class="form-control select"
								onchange="fnOnChangeValue(this,'iteration');">
								<option value="All">All</option>
								<%-- <%
									sql = "SELECT DISTINCT IterationName  FROM mysqlbdd.iteration";
										res = cmrt.executeQuery(sql);
										res.beforeFirst();
										while (res.next()) {
											String Iname = res.getString("IterationName");
								%>
								<option value="<%=Iname%>"><%=Iname%></option>
								<%
									}
								%> --%>
							</select>


						</div>
					</td>

					<!-- ****************************this is selection -->
					<td>

						<div class="dropdown">
							<select style="width: 170px;" name="FList" id="FList"
								class="form-control select"
								onchange="fnOnChangeRelease(this,'feature');">
								<option value="All">All</option>
								<%-- <%
									sql = "SELECT DISTINCT UserStoryName  FROM mysqlbdd.userstory";
										res = cmrt.executeQuery(sql);
										res.beforeFirst();
										while (res.next()) {
											String featurename = res.getString("UserStoryName");
								%>
								<option value="<%=featurename%>"><%=featurename%></option>
								<%
									}
								%> --%>
							</select>
						</div>
					</td>
					<td><input type="button" id="DD12" class="button"
						value="Search Story" onclick="return CmdAdd_onclick()"
						style="width: 170px; margin-right: 13px;" /></td>
					

				</tr>

				</table>
				<%
					} catch (SQLException sqe) {
						out.println(sqe);
					}
				%>
				<table id="mainTable" BORDER="0">
						
				</table>
				<br></br>
				<table style="width:746px;margin-left:170px" cellpadding=0 cellspacing=0>
				<tr>
				
				<td>
					<textarea name="DemandTXTArea" id="DemandTXTArea" style="width:746px;height:150px"
						onFocus="parent_disable();" onclick="parent_disable();"> 
						User Story content will appear here based on selection...
					</textarea>
				</td>
				</tr>
				<tr>
					<td> <input type="submit" class="button"
				value="Create Feature" align="middle" style="margin-right: 4px;" />
			<input type="reset" class="button" value="Reset" align="middle"
				style="margin-right: 150px;" onClick="window.location.reload();" /> </td>
				</tr>				
			</table>
			<br /> <input type="hidden" id="DemandFilename1"
				name="DemandFilename1" value="" /> <input type="hidden"
				id="DemandFilename2" name="DemandFilename2" value="" /> <input
				type="hidden" id="ReleaseName1" name="ReleaseName1" value="" /> <input
				type="hidden" id="IterationName1" name="IterationName1" value="" />
			<input type="hidden" id="FeatureName1" name="FeatureName1" value="" />
			<input type="hidden" id="almtool1" name="almtool1" value="" />
			<input type="hidden" id="FromPage" name="FromPage" value="CreateFileNewUI.jsp" />
			<input type="hidden" id="DemandStoryName1" name="DemandStoryName1"
				value="" /> <BR /> 


		</form>

	</div>
</body>
</html>