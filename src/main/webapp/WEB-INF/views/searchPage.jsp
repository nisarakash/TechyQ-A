<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

<title>TechQA</title>
</head>
<body>
	<%@ include file="loginLogoHeader.jsp"%>

	<!-- Section for search box  -->
	<div class="container" style="margin-top: 20px;">
		<div class="row">
			<div class="col-md-11">
				<div class="input-group" id="adv-search" style="float: left;">
					<input type="text" class="form-control" placeholder="Question" />

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

	<div>

		<div id="content" class="snippet-hidden"
			style="float: left; width: 70%;">
			<div id="mainbar" style="margin-left: 10%;">
				<div class="subheader">
					<h1>Search Questions</h1>
				</div>
				<div id="questions" class="content-padding">
					<c:forEach items="${questions}" var="q">
						<div class="question-summary" id="question-summary-${q.qid}">
							<div class="statscontainer">
								<div class="statsarrow"></div>
								<div class="stats">
									<div class="vote">
										<div class="votes">
											<span class="vote-count-post "><strong>0</strong></span>
											<div class="viewcount">votes</div>
										</div>
									</div>
									<div class="status unanswered">
										<strong>0</strong>answers
									</div>
								</div>
							</div>
							<div class="summary">
								<h3>
									<a href="answers?qid=${q.qid}" class="question-hyperlink">${q.qtitle}</a>
								</h3>

								<div class="started fr">
									<div class="user-info ">
										<div class="user-action-time">
											asked on <span>${q.qtimestamp}</span>
										</div>
										<div class="user-gravatar32">
											<span class="glyphicon glyphicon-user"></span>
										</div>
										<div class="user-details">${q.userName}</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>

			</div>
		</div>

		<div id="hot-network-questions" class="module"
			style="float: right; margin-top: 30px; width: 28%;">
			<h4>Hot Network Questions</h4>
			<ul>
				<li>
					<div class="favicon favicon-superuser" title="Super User"></div> <a
					href="http://superuser.com/questions/1058943/tiny-copper-waffle-squares-inside-computer"
					class="js-gps-track"
					data-gps-track="site.switch({ item_type:9, target_site:3 }); posts_hot_network.click({ item_type:2, location:9 })">
						Tiny copper waffle squares inside computer </a>

				</li>

			</ul>


		</div>
	</div>
</body>
</html>

