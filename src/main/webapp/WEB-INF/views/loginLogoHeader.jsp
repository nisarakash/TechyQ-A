<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

	<li class="active"><a href="#" id="myTabDrop1"
		class="dropdown-toggle" data-toggle="dropdown"> Challenges <b
			class="caret"></b>
	</a>

		<ul class="dropdown-menu" role="menu">
			<li><a href="createChallenges">Create Challenge</a></li>
			<li><a href="openChallenges">Open Challenges</a></li>
			<li><a href="reviewChallenges">Challenges Under Review</a></li>
			<li><a href="closeChallenges">Closed Challenges</a></li>
		</ul></li>
	<li><a href="#seminar">Seminars</a></li>

</ul>
