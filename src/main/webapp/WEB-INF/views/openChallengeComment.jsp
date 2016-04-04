<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<title>Insert title here</title>
</head>
<body>

	<%@ include file="loginLogoHeader.jsp"%>
	<div style="width: 100%; padding-left: 10%; padding-right: 10%;"
		class="container">
		<p class="text-center" style="font-size: 30px;">${challenge.title}</p>
		<p class="text-center" style="font-size: 25px;">${challenge.question}</p>
		<div style="float: right; width: 43%;">
			<h4 class="text-right">by ${challenge.hostUser} on
				${challenge.startTime}</h4>
		</div>
	</div>
	<br />

	<div style="padding-right: 5%; padding-left: 5%;">

		<div style="float: left; width: 48%;">
			<label class="control-label" for="desc">Host Answer</label>
			<textarea class="form-control" id="answer" name="answer" rows="10"
				readonly="readonly">${challenge.hostAnswer}</textarea>
			<br />
			<div class="col-lg-7" style="float: right;">
				<button type="button" class="btn btn-success"
					onclick="incrCount(this)">
					<span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span>
				</button>
			</div>

		</div>
		<div style="float: right; width: 48%;">
			<label class="control-label" for="desc">Opponent Answer</label>
			<textarea class="form-control" id="answer" name="answer" rows="10"
				readonly="readonly">${challenge.opponentAnswer}</textarea>
			<br />
			<div class="col-lg-7" style="float: right;">
				<button type="button" class="btn btn-success"
					onclick="incrCount(this)">
					<span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span>
				</button>

			</div>

		</div>
		<input type='hidden' name='questionid' value='${question.qid}' /> <br>

	</div>

	<!-- <div class="container-fluid">
		<div class="row">
			<div class="col-lg-6">
				<div>
					<button type="button" id="testBtn1"
						class="btn btn-success glyphicon glyphicon-thumbs-up"
						onclick="incrCount(this)">4</button>
					<button type="button" id="testBtnDown1"
						class="btn btn-danger glyphicon glyphicon-thumbs-down"
						onclick="decrCount(this)">4</button>
				</div>

			</div>
			<div class="col-lg-6">
				<div>
					<button type="button" id="testBtn2"
						class="btn btn-success glyphicon glyphicon-thumbs-up"
						data-loading-text="... " onclick="incrCount(this)">0</button>
					<button type="button" id="testBtnDown2"
						class="btn btn-danger glyphicon glyphicon-thumbs-down"
						onclick="decrCount(this)">0</button>
				</div>

			</div>
		</div>
	</div>
 -->

	<div>
		<h2 class="col-sm-4" style="padding-left: 10%;">Comments</h2>
	</div>
	<div class="container" style="padding-left: 15%">
		<c:forEach items="${comments}" var="a">
			<br />
			<br />
			<blockquote class="blockquote-reverse">
				<p>${a.comment}</p>
				<footer>${a.userName}&nbsp;commented&nbsp;on&nbsp;${a.timeStamp}</footer>
			</blockquote>

		</c:forEach>
	</div>

	<script type="text/javascript">
		function incrCount(btn) {
			var cnt = btn.innerHTML;
			cnt++;
			btn.innerHTML = ' ' + cnt;
		}
		function decrCount(btn) {
			var cnt = btn.innerHTML;
			cnt--;
			btn.innerHTML = ' ' + cnt;
		}
	</script>


</body>
</html>