<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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
<script
	src="resources/js/search.js"></script>
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

							<button type="button" class="btn btn-primary" onclick="searchQuestion()">
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
			<div id="mainbar" style="margin-left: 10%;width: 100%">
				<div class="subheader" style="width: 100%;">
					<h1>Search Questions</h1>
				</div>
				<div id="questions" class="content-padding" style="width: 100%;">
				<c:if test="${not empty  Found}">
				<strong>${Found}</strong>
				</c:if>
					<c:forEach items="${topquestion}" var="q">
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
										<br>
										<c:set var="shortDesc" value="${fn:substring(q.qquestion, 0, 40)}" />
										<i>${shortDesc}...</i>
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


	</div>
</body>
</html>

