<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.io.File"%>
<%@page import="com.cg.bdd.common.Common_Runtime"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script language="javascript">
  function DisableRightClick() 
  {
     if (event.button == 2) 
      {
       alert("Right Click is not possible Here !")
      }
      
   }
//srs      document.onmousedown=DisableRightClick;
 // "D:/CSS_BDD/WebContent/Report.jsp"
</script>
</head>
<body>
	<h1>Directories</h1>
	<ul>
		<%
		Common_Runtime cmrt = new Common_Runtime();
response.setIntHeader("Refresh", 5);
String root= cmrt.m_autReportsPath.replace("\\","\\\\");
//"//CSS_BDD//WebContent//BDD//SerenityOptikPOC//target//";
//cmrt.m_autReportsPath.replace("\\","\\\\");

System.out.println("reports path "+ root);
//D:\Demand\Reports
java.io.File file;
java.io.File dir = new java.io.File(root);
String[] list = dir.list();
System.out.println("List Length = "+ list.length);
if(list != null){
	if (list.length > 0) {
		for (int i = 0; i < list.length; i++) {
		  file = new java.io.File(root + list[i]);
		  if (file.isFile() && file.toString().contains(".html")) {	  
		  %>
		<li><a href=".//WebContent//BDD//SerenityOptikPOC//target//<%=list[i]%>" target="m_page"><%=list[i]%></a><br>
			<%
		     }
		  }
		}
}

%>
	</ul>
	<li><a href="https://en.wikipedia.org/wiki/Main_Page"
		target="m_page">wiki</a><br>
</body>
</html>
