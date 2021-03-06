<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

<title>User Posted Challenges</title></head>
<body>
<%@ include file="loginLogoHeader.jsp"%>
	
	<div class="container">
    	
  			
        	<div class="row">
                        <div class="col-sm-12 col-sm-8">
                            <p style="font-size: 70px;">${user.firstName} ${user.lastName}</p>
                            <p style="font-size: 30px;"><strong style="font-size: 30px;">Username: </strong>${user.username} </p>
                            <p style="font-size: 30px;"><strong style="font-size: 30px;">Email: </strong>${user.email}</p>
                            <p style="font-size: 30px;"><strong style="font-size: 30px;">State: </strong>${user.state}</p>
                            <p style="font-size: 30px;"><strong style="font-size: 30px;">Gender: </strong>${user.gender}</p>
                            <p style="font-size: 30px;"><strong style="font-size: 30px;">Points: </strong>${user.points}</p>
                            <p style="font-size: 30px;"><strong style="font-size: 30px;">Expertise: </strong>${user.level}</p>
                        </div><!--/col-->          
                        <div class="col-sm-12 col-sm-4 text-center">
                                 <!--<img src="https://cdn2.iconfinder.com/data/icons/rcons-user/32/male-shadow-circle-512.png" alt="" class="center-block img-circle img-responsive"
                                style="width: 235px;padding-bottom: 10px;"> -->
                                 <img src="${image}" alt="" class="center-block img-circle img-responsive"
                                style="width: 235px;padding-bottom: 10px;" >
                            	<div class="progress" style="height: 10px;">
								  <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40"
  											aria-valuemin="0" aria-valuemax="100" style="width:${width}" >  										
  									</div>
  							</div>
                        </div>  <!--/col-->

                        
                        <div class="col-sm-12 col-sm-4" style="padding-top: 180px;">                        
                            
                            <button class="btn btn-info btn-block"><span class="fa fa-user"></span> Edit Profile </button>
                        </div><!--/col-->
                       
              		</div><!--/row-->

    	  
    					<ul id="myTab" class="nav nav-tabs">
						<li><a href="userQuestion"> Questions </a></li>
						<li><a href="userChallenge">Challenges Posted</a></li>
						<li><a href="userAttendedChallenge">Challenges Attended</a></li>
						</ul> 

<table class="table table-hover">
								<thead>
									<tr>
										<th style="width: 70%;"><center>Challenge</center></th>
										<th style="width: 10%;">Posted By</th>
										<th style="width: 10%;">Created On</th>
										<th style="width: 10%;">Points</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${userAttendedChallenges}" var="uac">
										<tr>
										<td><center>
											<c:choose>
												<c:when test="${upc.challengeStatus == 1}">	
													<a href="challengeq?challengeID=${uac.challengeID}">${uac.title}</a>
												</c:when>
												<c:otherwise>
													<a href="challengec?challengeID=${uac.challengeID}">${uac.title}</a>
												</c:otherwise>
											</c:choose>
										</center></td>
										<td style="width: 10%;">${uac.hostUser}</td>
										<td style="width: 10%;">${uac.startTime}</td>
										<td style="width: 10%;">${uac.points}</td>
										</tr>
									</c:forEach>
								</tbody>
	 						</table>
</body>
</html>