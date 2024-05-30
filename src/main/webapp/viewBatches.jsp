<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Batches</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<h2>Batch Details</h2>
<table border="1" class="table">
<tr>
	<th>Batch Id</th>
	<th>Type Of Batch</th>
	<th>Time</th>
	<th>--</th>
	<th>--</th>
	<th>--</th>
</tr>
<core:forEach var="batch" items="${sessionScope.batches}">
	<tr>
	<td><core:out value="${batch.getBid()}"></core:out></td>
	<td><core:out value="${batch.getTypeofbatch()}"></core:out> </td>
	<td><core:out value="${batch.getTime()}"></core:out> </td>
	<td>
		<form action="BatchController" method="post">
			<input type="hidden" name="flag" value="3">
			<input type="hidden" name="bid" value="${batch.getBid()}">
			<input type="submit" value="delete">
		</form>
	</td>	
	<td>
		<a href="BatchController?flag=4&bid=${batch.getBid()}">Update</a>
	</td>	
	<td>
		<a href="ParticipantsController?bid=${batch.getBid()}">Participants</a>
	</td>	
	
	</tr>
</core:forEach>
</table>
<br/>
<a href="index.jsp">Back</a>
</body>
</html>