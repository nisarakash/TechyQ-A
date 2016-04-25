<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
	<html>
<head>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link href='resources/css/globalalter.css' rel="stylesheet"
	type="text/css">
<link href='resources/css/fileUpload.css' rel="stylesheet"
	type="text/css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<title>Upload File Request Page</title>
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

	<li ><a href="#" id="myTabDrop1"
		data-toggle="dropdown"> Challenges <b
			class="caret"></b>
	</a>

		<ul class="dropdown-menu" role="menu">
			<li><a href="createChallenges">Create Challenge</a></li>
			<li><a href="openChallenges">Open Challenges</a></li>
			<li><a href="reviewChallenges">Challenges Under Review</a></li>
			<li><a href="closeChallenges">Closed Challenges</a></li>
		</ul></li>
	<li class="active"><a href="video">Seminars</a></li>

</ul>


	<div class="container"
		style="margin-right: 1%; margin-left: 6%; width: 90%;">
		<br />
		<div style="float: left; width: 80%;">
			<div class="panel-heading">
				<h3>Latest Videos</h3>
			</div>
			<div class="panel-body">
				<c:forEach items="${latestVideo}" var="video">
					<div style="float: left; width: 20%">
						<a href="watchVideo?videoId=${video.videoId}"> <img
							src="${video.thumbnailLocation}" width="200" height="150"
							style="padding: 1%;">
							<center>${video.videoTitle}</center>
						</a>
					</div>
				</c:forEach>

			</div>

		</div>
		<div style="float: right; width: 20%;">
			<div>
				<div class="col-md-13">
					<div class="input-group" id="adv-search" style="float: left;">
						<input type="text" class="form-control" placeholder="Keyword"
							id="topic" />

						<div class="input-group-btn">
							<div class="btn-group" role="group">

								<button type="button" class="btn btn-primary"
									onclick="searchQuestion()">
									<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="panel panel-default" style="margin-top: 30%;">
				<div class="panel-heading">
					<strong>Upload Files</strong>
				</div>
				<div class="panel-body">

					<form action="uploadFile" method="post"
						enctype="multipart/form-data" name="uploadForm"
						id="js-upload-form">
						<!-- <div class="form-inline">
							
						</div> -->
						<div class="form-group">
							<label for="document-name">Title :</label> <input type="text"
								class="form-control" id="document-name" name="videoTitle"
								placeholder="">
						</div>
						<div class="form-group">
							<label for="document-name">Description :</label>
							<textarea rows="4" class="form-control" id="document-name"
								name="videoDesc" placeholder=""></textarea>
						</div>

						<div class="form-group">
							<input type="file" name="file" id="js-upload-files">
						</div>
						<button type="submit" class="btn btn-sm btn-primary"
							id="js-upload-submit">Upload Video</button>
					</form>
					</br>
					<div class="panel-footing">
						<span> Note: Upload .mp4 format vidoes only</span>
						<span> Note: It will take several minutes to upload</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>