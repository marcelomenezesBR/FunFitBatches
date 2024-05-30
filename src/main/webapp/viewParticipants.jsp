<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Participants</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<h2>Participants Details</h2>
<table border="1" class="table">
<tr>
	<th>Participants Id</th>
	<th>First Name</th>
	<th>Age</th>
	<th>PhNumber </th>
	<th>Batch Id</th>
	<th> -- </th>
	<th> -- </th>
</tr>
<core:forEach var="participant" items="${sessionScope.participants}">
	<tr>
	<td><core:out value="${participant.getPid()}"></core:out> </td>
	<td><core:out value="${participant.getFname()}"></core:out> </td>
	<td><core:out value="${participant.getAge()}"></core:out> </td>
	<td><core:out value="${participant.getPhonenumber()}"></core:out> </td>
	<td><core:out value="${participant.getBid()}"></core:out> </td>
	<td>
		<form action="ParticipantsController" method="post">
			<input type="hidden" name="flag" value="3">
			<input type="hidden" name="pid" value="${participant.getPid()}">
			<input type="submit" value="delete">
		</form>
	</td>
		<td>
		<a href="ParticipantsController?flag=4&pid=${participant.getPid()}">Update</a>
	</td>
	</tr>
</core:forEach>
</table>
<br/>
<a href="index.jsp">Back</a>
</body>
</html>