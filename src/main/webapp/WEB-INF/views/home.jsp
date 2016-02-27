<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="-1">
<title>SignUp Page</title>
<script type="text/javascript"
	src="<c:url value="/resources/js/bootstrap.min.js " />"></script>
<script type="text/javascript"
	src="<c:url value="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js" />"></script>

<link
	href="<c:url value="/resources/css/globalalter.css" />"
	rel="stylesheet" type="text/css">
<link
	href="<c:url value="/resources/css/bootstrap-responsive.min.css" />"
	rel="stylesheet" type="text/css">
<link
	href="<c:url value="/resources/css/bootstrap.min.css" />"
	rel="stylesheet" type="text/css">

<link
	href="<c:url value="http://teamtreehouse.com/assets/favicon.ico" />"
	rel="shortcut icon">
<link
	href="<c:url value="http://teamtreehouse.com/assets/favicon.ico" />"
	rel="icon">
<script type="text/javascript">
    history.pushState(null, null,window.location.href);
    window.addEventListener('popstate', function(event) {
    history.pushState(null, null, window.location.href);
    });
    document.addEventListener("contextmenu", function(e){
        e.preventDefault();
    }, false);
    </script>

<title>TechQA</title>
<style>
table {
    border-collapse: collapse;
    width: 100%;
}

th{
    text-align: left;
    padding: 8px;
}
td{
	vertical-align:middle;
	
	
	border:1px solid #ffffff;
	border-width:0px 1px 1px 0px;
	text-align:center;
	padding:16px;
	font-size:13px;
	font-family:Comic Sans MS;
	font-weight:bold;
	color:#003f7f;
}
tr:nth-child(odd){ background-color:#d3dded }
tr:nth-child(even){ background-color:#ffffff }
tr:first-child td{
		background:-o-linear-gradient(bottom, #00007f 5%, #005fbf 100%);	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #00007f), color-stop(1, #005fbf) );
	background:-moz-linear-gradient( center top, #00007f 5%, #005fbf 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr="#00007f", endColorstr="#005fbf");	background: -o-linear-gradient(top,#00007f,005fbf);

	background-color:#00007f;
	border:0px solid #ffffff;
	text-align:center;
	border-width:0px 0px 1px 1px;
	font-size:18px;
	font-family:Trebuchet MS;
	font-weight:bold;
	color:#ffaa56;
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
<div id="search-box" align="center">
		<form:form name='search'
			action="" method='POST' autocomplete='none'>
		<input type='text' name='topic' align="center">
		<input type="submit" name= "submit" value="Search">
		
		</form:form>
		<br>
		<br>
		<br>
</div>
<div align="right">
<input type="submit" align="right" name="newPost" value="Start new Thread" onclick="myFunction('${appName}')">	
<br>
<br>
</div>	
<table>
<tr>
	<td>Title</td>
	<td>Date</td>
	<td>Posted By</td>
	</tr>
<c:forEach items="${questions}" var="q">
    <tr>
        <td><a href="url">${q.qtitle}</a></td>
        <td>${q.qtimestamp}</td>
        <td>${q.userName}</td>
    </tr>
</c:forEach>
</table>
	<script>
function myFunction(appName) {
	 window.location = appName+"/newtopic";
}
</script>
</body>
</html>