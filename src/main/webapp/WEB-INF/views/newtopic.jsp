<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Start new Topic</title>
</head>
<body>
<form:form action="${pageContext.request.contextPath}/addTopic" method="POST" >
	<table>
		<tr>
			<td> Title </td>
			<td> <input type="text" name="title" style="width: 431px;" path="title"/></td>	
		</tr>
		<tr>
			<td text-align="top" > Description</td>
		</tr>
		<tr>
			<td text-align="top" > </td>
			<td> <input type = "text" name="desc" style="width: 431px; height: 418px;" path="desc"/></td>
		</tr>	
		<tr>
			<td></td>
			<td align ="center"> <input type="submit" value="Submit"/></td>
		</tr>	
	</table>
	
</form:form>
</body>
</html>