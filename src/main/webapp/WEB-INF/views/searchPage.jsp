<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link href='resources/css/globalalter.css' rel="stylesheet"
	type="text/css">
<title>TechQA</title>
<style>
table {
	border-collapse: collapse;
	width: 100%;
}

th {
	text-align: left;
	padding: 8px;
}

td {
	vertical-align: middle;
	border: 1px solid #ffffff;
	border-width: 0px 1px 1px 0px;
	text-align: center;
	padding: 16px;
	font-size: 13px;
	font-family: Comic Sans MS;
	font-weight: bold;
	color: #003f7f;
}

tr:nth-child(odd) {
	background-color: #d3dded
}

tr:nth-child(even) {
	background-color: #ffffff
}

tr:first-child td {
	background: -o-linear-gradient(bottom, #00007f 5%, #005fbf 100%);
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #00007f
		), color-stop(1, #005fbf));
	background: -moz-linear-gradient(center top, #00007f 5%, #005fbf 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr="#00007f",
		endColorstr="#005fbf");
	background: -o-linear-gradient(top, #00007f, 005fbf);
	background-color: #00007f;
	border: 0px solid #ffffff;
	text-align: center;
	border-width: 0px 0px 1px 1px;
	font-size: 18px;
	font-family: Trebuchet MS;
	font-weight: bold;
	color: #ffaa56;
}

th {
	background-color: #4CAF50;
	color: white;
}
</style>
</head>
<body>
	<header id="heading">
	<div class="container text-center">
		<h1>Techy Q&A</h1>
	</div>
	</header>
	<br />
	<br />
	<div id="search-box" align="center">
		<form name='search' action="question" method='POST' autocomplete='none'>
			<input type='text' name='topic' align="center">
			<input type="submit" name="submit" value="Search">

		</form>
		<br> <br> <br>
	</div>
	<div align="right">
		<input type="submit" align="right" name="newPost"
			value="Start new Thread" onclick="myFunction('${appName}')">
		<br> <br>
	</div>
	<c:if test="${not empty topquestion}">
	<table>
		<tr>
			<td>Title</td>
			<td>Date</td>
			<td>Posted By</td>
		</tr>
		<c:forEach items="${topquestion}" var="q">
			<tr>
				<td><a href="answers?qid=${q.qid}">${q.qtitle}</a></td>
				<td>${q.qtimestamp}</td>
				<td>${q.userName}</td>
			</tr>
		</c:forEach>
	</table>
	</c:if>
	<c:if test="${empty topquestion}">
    <table>
		<tr>
			<td>Title</td>
			<td>Date</td>
			<td>Posted By</td>
		</tr>
		<tr>
		<td><b>No results</b></td>
		</tr>
    </c:if>
	<script>
		function myFunction(appName) {
			window.location = appName + "/newtopic";
		}
	</script>
</body>
</html>

