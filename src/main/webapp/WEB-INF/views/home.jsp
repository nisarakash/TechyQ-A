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
			<c:if test="${sessionScope.username != null }">
				<div class="input-group-btn" style="float: right;">
					<div class="btn-group" role="group">
						<div>
							<button type="button" class="btn btn-primary"
								onclick="myFunction('${appName}')">Start a new Thread</button>
						</div>
					</div>
			</c:if>
		</div>
	</div>
	</div>

	<script>
		function myFunction(appName) {
			window.location = appName + "/newtopic";
		}
	</script>

	<div>

		<div id="content" class="snippet-hidden"
			style="float: left; width: 60%;">
			<div id="mainbar" style="margin-left: 10%; width: 100%;">
				<div class="subheader" style="width: 100%;">
					<h1>New Questions</h1>
				</div>
				<div id="questions" class="content-padding" style="width: 100%;">
					<c:forEach items="${questions}" var="q">
						<div class="question-summary" id="question-summary-${q.qid}"
							style="width: 100%;">
							<div class="statscontainer" style="width: 8%; float: left;">
								<div class="stats" style="width: 100%;">
									<div class="status unanswered" style="width: 100%;">
										<strong>${q.numberOfAnswers }</strong>answers
									</div>
								</div>
							</div>
							<div class="summary" style="width: 90%; float: right;">
								<div style="width: 82%; float: left;">
									<h3>
										<a href="answers?qid=${q.qid}" class="question-hyperlink">${q.qtitle}</a>
									</h3>
								</div>
								<div class="started fr" style="width: 16%; float: right;">
									<div class="user-info">
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
			<h4>Hot Questions</h4>
			<ul>
				<c:forEach items="${hotQuestions}" var="q">
					<li>
						<div class="favicon favicon-superuser" title="Super User"></div> <a
						href="answers?qid=${q.qid}"> ${q.qtitle } </a>

					</li>
				</c:forEach>
			</ul>


		</div>
	</div>
</body>
</html>

