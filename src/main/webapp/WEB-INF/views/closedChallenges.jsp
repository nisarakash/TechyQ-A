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
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link href='resources/css/LoginHeader.css' rel="stylesheet"
	type="text/css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link href="<c:url value="/resources/css/globalalter.css"/>"
	rel="stylesheet" type="text/css">


</head>
<body>

	<!--  Section for Login header -->
	<nav class="navbar navbar-default"
		style="margin-bottom:0px; background-color:#fff;">
	<div class="container-fluid">

		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">TechyQ&A</a>
		</div>


		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">

			<form id="signin" class="navbar-form navbar-right" role="form">
				<div class="input-group">
					<span class="input-group-addon"><i
						class="glyphicon glyphicon-user"></i></span> <input id="email"
						type="email" class="form-control" name="email" value=""
						placeholder="Email Address">
				</div>

				<div class="input-group">
					<span class="input-group-addon"><i
						class="glyphicon glyphicon-lock"></i></span> <input id="password"
						type="password" class="form-control" name="password" value=""
						placeholder="Password">
				</div>

				<button type="submit" class="btn btn-primary">Login</button>
			</form>

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

		<li class="active"><a href="#" id="myTabDrop1"
			class="dropdown-toggle" data-toggle="dropdown"> Challenges <b
				class="caret"></b>
		</a>

			<ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1">
				<li><a href="#create" tabindex="-1" data-toggle="tab">Create
						Challenge</a></li>
				<li><a href="#open" tabindex="-1" data-toggle="tab">Open
						Challenges</a></li>
				<li><a href="#review" tabindex="-1" data-toggle="tab">Challenges
						Under Review</a></li>
				<li><a href="#close" tabindex="-1" data-toggle="tab">Closed
						Challenges</a></li>
			</ul></li>
		<li><a href="#seminar" data-toggle="tab">Seminars</a></li>

	</ul>

	<!-- Section for search box  -->
	<div class="container" style="margin-top: 20px;">
		<div class="row">
			<div class="col-md-12">
				<div class="input-group" id="adv-search">
					<input type="text" class="form-control" placeholder="Search for Challenge" />
					<div class="input-group-btn">
						<div class="btn-group" role="group">

							<button type="button" class="btn btn-primary">
								<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<table class="table table-hover">
		<thead>
			<tr>
				<th style="width: 70%;">Question</th>
				<th style="width: 10%;">Posted By</th>
				<th style="width: 10%;">Created On</th>
				<th style="width: 10%;">Points</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${questions}" var="q">
				<tr>
					<td><a href="challengeq?qid=${q.qid}">${q.qtitle}</a></td>
					<td style="width: 70%;">${q.qtimestamp}</td>
					<td style="width: 10%;">${q.userName}</td>
					<td style="width: 10%;">${q.date}</td>
					<td style="width: 10%;">${q.points}</td>
				</tr>
			</c:forEach>
		</tbody>
		</div>
		<div class="tab-pane fade" id="review"></div>
		<div class="tab-pane fade" id="close"></div>
		<div class="tab-pane fade" id="seminar">sfsdfsdf</div>

		</div>
</body>
</html>