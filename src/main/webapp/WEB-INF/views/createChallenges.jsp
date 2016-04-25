<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Challenges</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="resources/js/points.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link href='resources/css/LoginHeader.css' rel="stylesheet"
	type="text/css">
<link href='resources/css/points.css' rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link href="<c:url value="/resources/css/globalalter.css"/>"
	rel="stylesheet" type="text/css">
<script type="text/javascript">

function validate(){
	var title = document["ChallengeForm"]["title"].value;
	var desc = document["ChallengeForm"]["ques"].value;
	var ans = document["ChallengeForm"]["ans"].value;
	if (title==null || title=="")
	  {
	  alert("Please enter a Title!");
	  return false;
	  }
	else if (desc==null || desc=="")
		  {
		  alert("Please enter Question description!");
		  return false;
		  }
	else if (ans==null || ans=="")
	  {
	  alert("Please enter an Answer to the question!");
	  return false;
	  }
}
</script>

</head>
<body>

		<!--  Section for Login header -->
<nav class="navbar navbar-default"
	style="margin-bottom: 0px; background-color: #fff;">
	<div class="container-fluid">

		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="${pageContext.servletContext.contextPath}/home">TechyQ&A</a>
		</div>


		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<c:if test="${sessionScope.username == null}">
				<ul class="nav navbar-right ">
					<li><a href="signUp" >Sign Up</a></li>
				</ul>
				<form id="signin" class="navbar-form navbar-right" role="form"
					name='loginForm'
					action="${pageContext.servletContext.contextPath}/login"
					method='POST' autocomplete='none' onsubmit="return validate()">
					<div class="input-group">
						<span class="input-group-addon"><i
							class="glyphicon glyphicon-user"></i></span> <input id="email"
							class="form-control" name="username" value=""
							placeholder="Username">
					</div>

					<div class="input-group">
						<span class="input-group-addon"><i
							class="glyphicon glyphicon-lock"></i></span> <input id="password"
							type="password" class="form-control" name="password" value=""
							placeholder="Password">
					</div>

					<button type="submit" class="btn btn-primary">Login</button>
				</form>


			</c:if>
			<c:if test="${sessionScope.username != null}">
				<ul class="nav navbar-right">

					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false">${sessionScope.firstname}
							<span class="caret"></span>
					</a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="profile">Profile</a></li>
							<li><a href="logout">Logout</a></li>
						</ul></li>
				</ul>
			</c:if>
		</div>
	</div>
</nav>


<!-- Header Image -->
<header id="heading">
	<div class="container text-center">
		<h1>Techy Q&A</h1>
	</div>
</header>

<!-- Navigation Bar -->
<ul id="myTab" class="nav nav-tabs">
	<li><a href="home"> Q & A </a></li>

	<li  class="active"><a href="#" id="myTabDrop1"
		data-toggle="dropdown"> Challenges <b
			class="caret"></b>
	</a>

		<ul class="dropdown-menu" role="menu">
			<li><a href="createChallenges">Create Challenge</a></li>
			<li><a href="openChallenges">Open Challenges</a></li>
			<li><a href="reviewChallenges">Challenges Under Review</a></li>
			<li><a href="closeChallenges">Closed Challenges</a></li>
		</ul></li>
	<li><a href="video">Seminars</a></li>

</ul>


	<h2 align="center">Create New Challenge</h2>
	<strong><c:if test="${not empty emptyFields}">
			<div class="msg">${emptyFields}</div>
		</c:if></strong>
	<form name="ChallengeForm"
		action="${pageContext.servletContext.contextPath}/addChallenge"
		method='POST' class="form-horizontal" role="form"
		style="margin-left: 0px; margin-right: 0px;" onsubmit="return validate()">

		<div class="form-group"
			style="margin-bottom: 0px; margin-left: 0px; margin-right: 0px;">
			<label class="col-sm-2 control-label" for="title_id">Title</label>
			<div class="col-sm-9">
				<input class="form-control" type="text" id="title_id" name="title"
					placeholder="Enter Title" />

			</div>
		</div>
		<br>
		<div class="form-group"
			style="margin-bottom: 0px; margin-left: 0px; margin-right: 0px;">

			<label class="col-sm-2 control-label" for="ques">Question</label>
			<div class="col-sm-9">
				<textarea class="form-control" id="ques" name="ques" rows="4"
					placeholder="Enter Question"></textarea>
			</div>
		</div>
		<br>
		<div class="form-group"
			style="margin-bottom: 0px; margin-left: 0px; margin-right: 0px;">
			<label class="col-sm-2 control-label" for="ans">Answer</label>
			<div class="col-sm-9">
				<textarea class="form-control" id="ans" name="ans" rows="8"
					placeholder="Enter Answer"></textarea>
			</div>
		</div>

		<br>
		<div class="form-group"
			style="margin-bottom: 0px; margin-left: 0px; margin-right: 0px;">

			<label class="col-sm-2 control-label" for="points">Points</label>
			<div class="col-md-2" style="padding-right: 80px;">
				<div class="input-group">
					<span class="input-group-btn">
						<button type="button" class="btn btn-danger btn-number"
							data-type="minus" data-field="points">
							<span class="glyphicon glyphicon-minus"></span>
						</button>
					</span>
					<c:set var="points" value= "${sessionScope.points}"/>
					<c:choose>
					<c:when test="${(0 le points) && (points lt 200)}">
					<input type="text" name="points"
						class="form-control input-number" value="5" min="5" max="30"
						readonly="readonly" style="height: 27px;text-align:center;"> <span class="input-group-btn">
					</c:when>
					<c:when test="${(200 le points) && (points lt 500)}">
					<input type="text" name="points"
						class="form-control input-number" value="30" min="30" max="100"
						readonly="readonly" style="height: 27px;text-align:center;"> <span class="input-group-btn">
					</c:when>
					<c:when test="${(500 le points)}">
					<input type="text" name="points"
						class="form-control input-number" value="100" min="100" max="150"
						readonly="readonly" style="height: 27px;text-align:center;"> <span class="input-group-btn">
					</c:when>
					</c:choose>
					
						<button type="button" class="btn btn-success btn-number"
							data-type="plus" data-field="points">
							<span class="glyphicon glyphicon-plus"></span>
						</button>
					</span>
				</div>
			</div>
		</div>
		<br>

		<div class="form-group"
			style="margin-bottom: 0px; margin-left: 0px; margin-right: 0px;">
			<div class="col-sm-offset-2 col-sm-10">
				<input class="btn btn-success" type="submit" value="Submit"
					id="submit1">
				<input class="btn btn-cancel" type="button" value="cancel"
					id="cancel"
					onclick="window.location.href='${pageContext.request.contextPath}/home'">
			</div>

		</div>
	</form>
</body>
</html>