<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Batch</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<h2>Update Batch Details</h2>
<form action="BatchController" method="post">
<core:set var="curTime" value="${sessionScope.selectedBatch.getTime()}" />
<core:set var="curType" value="${sessionScope.selectedBatch.getTypeofbatch()}" />
<!-- <core:out value=";${curType};"></core:out> --> 

<label>TypeOfBatch</label>
<select name="typeofbatch">
<option value="">--Select Batch--</option>
<option value="Morning" <core:if test="${'morning' eq curType}">
		selected="selected"
	</core:if>>Morning</option>
<option value="Evening"  <core:if test="${'evening' eq curType}">
		selected="selected"
	</core:if>>Evening</option>
</select>
<br/>
<label>Time</label>
<select name="time">
<option value="">--Time--</option>
<%
for(int i=1,j=2;i<=12 && j<13;i++,j++){
	String opt = i +"-"+j;
	request.setAttribute("optionTime", opt);
	%>
	<option value="<%=i%>-<%=j %>" 
	<core:if test="${optionTime eq curTime}">
		selected="selected"
	</core:if>	
	><%=i%>-<%=j%></option>
	<% } %>
	
</select>
<br/>
<input type="hidden" name="bid" value="${sessionScope.selectedBatch.getBid()}">
<input type="hidden" name="flag" value="5">
<input type="submit" value="Update Batch"/>
<input type="reset" value="reset"/>
</form>
<br/>
<a href="index.jsp">Back</a>
</body>
</html>