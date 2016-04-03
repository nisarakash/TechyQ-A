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
	<header id="heading">
		<div class="container text-center">
			<h1>Techy Q&A</h1>
		</div>
	</header>
	<br />
	<div style="width: 100%; padding-left: 10%; padding-right: 10%;"
		class="container">
		<p class="text-center" style="font-size: 30px;">${question.qtitle}</p>
		<p class="text-center" style="font-size: 25px;">${question.qquestion}</p>
		<div style="float: right; width: 43%;">
			<h4 class="text-right">by ${question.userName} on
					${question.qtimestamp}</h4>
		</div>
	</div>
	<br />
	
	<div style="padding-right: 15%; padding-left: 5%;">
		<form:form action="${pageContext.request.contextPath}/addAns"
			method="POST" class="form-horizontal" role="form">

			<div class="form-group">

				<label class="col-sm-2 control-label" for="desc">Write your
					Answer</label>
				<div class="col-sm-10">
					<textarea class="form-control" id="answer" name="answer" rows="4"></textarea>
				</div>
				<input type='hidden' name='questionid' value='${question.qid}' />
			</div>
			<br>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<input class="btn btn-success" type="submit" value="Submit"
						id="submit">
				</div>

			</div>

		</form:form>
	</div>
	<br />
	<div class="container-fluid">
    <div class="row">
        <div class="col-lg-6">
            <h3> Challenger's Answer</h3>
<%--           <c:if test="${not empty question.answer2}">
 --%>            <p class="text-center" style="font-size: 25px;">${question.answer1}</p>
			<div style="float: right; width: 43%;">
				<h4 class="text-right">by ${question.userName} on
					${question.qtimestamp}</h4>
			</div>
			<div>
			<button type="button" id="testBtn1" class="btn btn-success glyphicon glyphicon-thumbs-up" onclick="incrCount(this)" >
    			4
    		</button>
			<button type="button" 	id="testBtnDown1" class="btn btn-danger glyphicon glyphicon-thumbs-down" onclick="decrCount(this)">
			4
			</button>
			</div>
			
<%-- 			</c:if>
 --%>        </div>
        <div class="col-lg-6">
           <h3>Challengee's Answer</h3>
           <p class="text-center" style="font-size: 25px;">${question.answer2}</p>
			<div style="float: right; width: 43%;">
				<h4 class="text-right">by ${question.userName} on
					${question.qtimestamp}</h4>
			</div>
			<div>
			<button type="button" id="testBtn2" class="btn btn-success glyphicon glyphicon-thumbs-up" 
			data-loading-text="... " onclick="incrCount(this)" >
    		0	
    		</button>
			<button type="button" 	id="testBtnDown2" class="btn btn-danger glyphicon glyphicon-thumbs-down" onclick="decrCount(this)">
			0
			</button>
			</div>
						
        </div>
    </div>
</div>
	
	
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
function incrCount(btn){
	var cnt = btn.innerHTML;
	cnt++;
	btn.innerHTML = ' '+ cnt;
}
function decrCount(btn){
	var cnt = btn.innerHTML;
	cnt--;
	btn.innerHTML = ' '+ cnt;
}
</script>	

</body>
</html>