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
   <li class = "active">
      <a href = "#home" data-toggle = "tab">
         Q & A
      </a>
   </li>
   
   <li class = "dropdown">
      <a href = "#" id = "myTabDrop1" class = "dropdown-toggle" data-toggle = "dropdown">
         Challenges 
         <b class = "caret"></b>
      </a>
      
      <ul class = "dropdown-menu" role = "menu" aria-labelledby = "myTabDrop1">
         <li><a href = "#open" tabindex = "-1" data-toggle = "tab">Open Challenges</a></li>
         <li><a href = "#review" tabindex = "-1" data-toggle = "tab">Challenges Under Review</a></li>
         <li><a href = "#close" tabindex = "-1" data-toggle = "tab">Closed Challenges</a></li>
      </ul>
      
   </li>
   <li><a href = "#seminar" data-toggle = "tab">Seminars</a></li>
	
</ul>

<div id = "myTabContent" class = "tab-content">

   <div class = "tab-pane fade in active" id = "home">
      
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