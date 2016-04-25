<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html">
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
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

<link rel="stylesheet" href="/resources/demos/style.css">
<title>Insert title here</title>
<body>
	<%@ include file="loginLogoHeader.jsp"%>

	<div
		style="width: 100%; padding-left: 10%; padding-right: 10%; padding-top: 2%;"
		class="container">

		<iframe
			style="width: 90%; height: 65%; margin-left: 5%; margin-bottom: 2%;"
			align="middle"
			src="http://www.youtube.com/embed/${video.videoLocation}?rel=0&amp;showinfo=0">
		</iframe>
		<%-- <video width="1024" style="padding: 1%;" controls>
			<source src="${video.videoLocation}" type=video/mp4>

			Your browser does not support the video tag.
		</video> --%>


		<p class="text-center" style="font-size: 30px;">${video.videoTitle}</p>
		<p style="font-size: 25px;">${video.videoDescription}</p>
		<div>
			<div style="float: right; width: 43%;">
				<h4 class="text-right">by ${video.userName} on
					${video.timeStamp}</h4>

			</div>
		</div>
	</div>
	<br />
	<div style="padding-right: 15%; padding-left: 5%;">
		<c:if test="${sessionScope.username != null }">
			<form:form
				action="${pageContext.request.contextPath}/addVideoComment"
				method="POST" class="form-horizontal" role="form">

				<div class="form-group">

					<label class="col-sm-2 control-label" for="desc">Write your
						Comment</label>
					<div class="col-sm-10">
						<textarea class="form-control" id="answer" name="comment" rows="4"></textarea>
					</div>
					<input type='hidden' name='videoId' value='${video.videoId}' />
				</div>
				<br>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<input class="btn btn-success" type="submit" value="Submit"
							id="submit">
					</div>

				</div>

			</form:form>
		</c:if>

	</div>
	<br />
	<div>
		<h2 class="col-sm-4" style="padding-left: 10%;">Comments</h2>
	</div>
	<br />
	<br />
	<div class="container">
		<c:forEach items="${videoComments}" var="a">
			<br />
			<br />
			<c:if test="${a.userName == video.userName}">
				<blockquote>
			</c:if>
			<c:if test="${a.userName != video.userName}">
				<blockquote class="blockquote-reverse">
			</c:if>
			<p>${a.comment}</p>
			<footer>${a.userName}&nbsp;commented&nbsp;on&nbsp;${a.timeStamp}</footer>
			</blockquote>
		</c:forEach>
	</div>
</body>
</html>