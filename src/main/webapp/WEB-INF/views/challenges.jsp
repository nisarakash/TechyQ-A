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
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link href="<c:url value="/resources/css/globalalter.css"/>"
	rel="stylesheet" type="text/css">


</head>
<body>
<header id="heading">
		<div class="container text-center">
			<h1>Techy Q&A</h1>
		</div>
	</header>

<ul id = "myTab" class = "nav nav-tabs">
   <li>
      <a href = "home">
         Q & A
      </a>
   </li>
   
   <li class = "active">
      <a href = "#" id = "myTabDrop1" class = "dropdown-toggle" data-toggle = "dropdown">
         Challenges 
         <b class = "caret"></b>
      </a>
      
      <ul class = "dropdown-menu" role = "menu" aria-labelledby = "myTabDrop1">
      	<li><a href = "challenges" tabindex="-1">Create Challenge</a></li>	
         <li><a href = "openChallenges" tabindex = "-1">Open Challenges</a></li>
         <li><a href = "#review" tabindex = "-1" data-toggle = "tab">Challenges Under Review</a></li>
         <li><a href = "#close" tabindex = "-1" data-toggle = "tab">Closed Challenges</a></li>
      </ul>
      
   </li>
   <li><a href = "#seminar" data-toggle = "tab">Seminars</a></li>
	
</ul>

<div id = "myTabContent" class = "tab-content">

   <div class = "tab-pane fade in active" id = "home">
   </div>
   <div class="tab pane-fade" id="create">
		<h2 align="center">Create New Challenge</h2>
		<strong><c:if test="${not empty emptyFields}">
				<div class="msg">${emptyFields}</div>
			</c:if></strong>
		<form name='ChallengeForm'
			action="${pageContext.servletContext.contextPath}/createChallenge"
			method='POST' class="form-horizontal" role="form" >

			<div class="form-group">
				<label class="col-sm-2 control-label" for="title_id">Title</label>
				<div class="col-sm-9">
					<input class="form-control" type="text" id="title_id" name="title" placeholder="Enter Title"/>
				
				</div>
			</div>
			<br>
			<div class="form-group">

				<label class="col-sm-2 control-label" for="ques">Question</label>
				<div class="col-sm-9">
					<textarea class="form-control" id="ques" name="ques" rows="4" placeholder="Enter Question"></textarea>
				</div>
			</div>
			<br>			
			<div class="form-group">
				<label class="col-sm-2 control-label" for="ans">Answer</label>
				<div class="col-sm-9">
					<textarea class="form-control" id="ans" name="ans" rows="8" placeholder="Enter Answer"></textarea>
				</div>
			</div>
			
			<br>
			<div class="form-group">

				<label class="col-sm-2 control-label" for="points">Points</label>
				<div class="col-sm-9">
					<input class="form-control" type="text" id="points" name="points" placeholder="Enter Points"/>
				</div>
			</div>
			<br >
			
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<input class="btn btn-success" type="submit" value="Submit"
						id="submit1" onclick="window.location.href='${pageContext.request.contextPath}/challenges'"> 
					<input class="btn btn-cancel" type="button"
						value="cancel" id="cancel" onclick="window.location.href='${pageContext.request.contextPath}/home'">
				</div>

			</div>
		</form>
	</div>
   
   
   <div class = "tab-pane fade" id = "open">
	<div id="search-box" align="center">
		<form class="form-horizontal" name='search' action="question" method='POST' autocomplete='none'>
			<div class="form-group">
				
				<div class="col-sm-offset-2 col-sm-4">
					<input class="form-control" id="search" name="search" />
				</div>
				<div class="col-sm-offset-1 col-sm-4">
					<input class="btn btn-success" type="submit" value="Search" id="submit"> 
				</div>
			</div>
			
		</form>
		<br> <br> <br>
	</div> 
	<table class = "table table-hover">
	   <thead>
 	     <tr>
    	     <th>Question</th>
        	 <th>Posted By</th>
         	 <th>Created On</th>
       		 <th>Points</th>
      	 </tr>
  	  </thead>
	  <tbody>
	  	<c:forEach items="${questions}" var="q">
			<tr>
				<td><a href="challengeq?qid=${q.qid}">${q.qtitle}</a></td>
				<td>${q.qtimestamp}</td>
				<td>${q.userName}</td>
				<td>${q.date}</td>
				<td>${q.points}</td>
			</tr>
		</c:forEach>
	  </tbody>   
   </div>
   <div class = "tab-pane fade"id="review">
   
   </div>
   <div class = "tab-pane fade"id="close">
   
   </div>
   <div class = "tab-pane fade" id = "seminar">
   </div>
   
</div>


</body>
</html>