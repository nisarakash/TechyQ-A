<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link href='resources/css/LoginHeader.css' rel="stylesheet"
	type="text/css">
<link href='resources/css/SearchBox.css' rel="stylesheet"
	type="text/css">
<link href='resources/css/all.css' rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link href="<c:url value="/resources/css/globalalter.css"/>"
	rel="stylesheet" type="text/css">
<script
	src="resources/js/search.js"></script>

<title>User Posted Challenges</title></head>
<body>
<%@ include file="profile.jsp"%>
<table class="table table-hover">
								<thead id="table_head">
									<tr>
										<th style="width: 60%;"><center>Question</center></th>
										<th style="width: 20%;">Posted By</th>
										<th style="width: 20%;">Created On</th>
									</tr>
								</thead>
								<tbody id="table_body">
									<c:forEach items="${userquestion}" var="uq">
										<tr>
										<td><center><a href="answers?qid=${uq.qid}">${uq.qtitle}</a></center></td>
										<td style="width: 10%;">${uq.userName}</td>
										<td style="width: 10%;">${uq.qtimestamp}</td>
										</tr>
									</c:forEach>
								</tbody>
	 						</table>
</body>
</html>