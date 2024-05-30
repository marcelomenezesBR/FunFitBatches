<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update participant</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<h2>Update Participants Details</h2>
<form action="ParticipantsController" method="post">

<label>FName</label>
<input type="text" name="fname" value="${sessionScope.selectedParticipant.getFname()}"><br/>
<label>Age</label>
<input type="number" name="age" value="${sessionScope.selectedParticipant.getAge()}"><br/>
<label>PhNumber</label>
<input type="text" name="phonenumber" value="${sessionScope.selectedParticipant.getPhonenumber()}"><br/>

<label>Batch</label>
<select name="bid">
<core:forEach var="bid" items="${sessionScope.batches}">
	<option value="<core:out value="${bid.getBid()}"></core:out>" <core:if test="${bid.getBid() eq sessionScope.selectedParticipant.getBid()}">
		selected="selected"
	</core:if>	> <core:out value="${bid.getTypeofbatch()}"></core:out> 
	- 
	<core:out value="${bid.getTime()}"></core:out></option>
</core:forEach>
</select>
<br/>
<input type="hidden" name="pid" value="${sessionScope.selectedParticipant.getPid()}">
<input type="hidden" name="flag" value="5">
<input type="submit" value="Update Participants"/>
<input type="reset" value="reset"/>
</form>
<br/>
<a href="index.jsp">Back</a>
</body>
</html>