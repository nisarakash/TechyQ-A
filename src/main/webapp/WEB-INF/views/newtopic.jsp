<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
<title>Start new Topic</title>
<script type="text/javascript">

function validate(){
	var title = document["newQues"]["title"].value;
	var desc = document["newQues"]["desc"].value;
	if (title==null || title=="")
	  {
	  alert("Please enter a Title!");
	  return false;
	  }
	else if (desc==null || desc=="")
		  {
		  alert("Please enter a Description!");
		  return false;
		  }
}
</script>

</head>
<body>
<%@ include file="loginLogoHeader.jsp"%>
	<br />
	<br />
	<div>
		<h1 align="center">ADD TOPIC HERE</h1>
	</div>
	<br />
	<div style="padding-right: 15%;">
		<form action="${pageContext.request.contextPath}/addTopic"
			method="POST"  class="form-horizontal"
			role="form" name="newQues" onsubmit="return validate()">
			<div class="form-group">

				<label class="col-sm-2 control-label" for="title_id">Title</label>
				<div class="col-sm-10">
					<input class="form-control" type="text" id="title_id" name="title"
						path="title" />
				</div>

			</div>
			<br>
			<div class="form-group">

				<label class="col-sm-2 control-label" for="desc">Description</label>
				<div class="col-sm-10">
					<textarea class="form-control" id="desc" name="desc" rows="8"
						path="desc"></textarea>
				</div>
			</div>
			<br>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<input class="btn btn-success" type="submit" value="Submit"
						id="submit"> 
					<input class="btn btn-cancel" type="button"
						value="cancel" id="cancel" onclick="window.location.href='${pageContext.request.contextPath}/home'">
				</div>

			</div>

		</form>
	</div>
</body>
</html>