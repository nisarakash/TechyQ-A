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
								<thead>
									<tr>
										<th style="width: 70%;"><center>Challenge</center></th>
										<th style="width: 10%;">Posted By</th>
										<th style="width: 10%;">Created On</th>
										<th style="width: 10%;">Points</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${userPostedChallenges}" var="upc">
										<tr>
										<td><center>
											<c:choose>
												<c:when test="${upc.challengeStatus == 0}">	
													<a href="challengeq?challengeID=${upc.challengeID}">${upc.title}</a>
												</c:when>
												<c:when test="${upc.challengeStatus == 1}">	
													<a href="challengeq?challengeID=${upc.challengeID}">${upc.title}</a>
												</c:when>
												<c:otherwise>
													<a href="challengec?challengeID=${upc.challengeID}">${upc.title}</a>
												</c:otherwise>
											</c:choose>
										</center></td>
										<td style="width: 10%;">${upc.hostUser}</td>
										<td style="width: 10%;">${upc.startTime}</td>
										<td style="width: 10%;">${upc.points}</td>
										</tr>
									</c:forEach>
								</tbody>
	 						</table>
</body>
</html>