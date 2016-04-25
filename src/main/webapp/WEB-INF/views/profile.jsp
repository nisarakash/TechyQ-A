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
<script
	src="resources/js/search.js"></script>
<title>My Profile</title>
</head>
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
                                <img src="https://cdn2.iconfinder.com/data/icons/rcons-user/32/male-shadow-circle-512.png" alt="" class="center-block img-circle img-responsive"
                                style="width: 235px;padding-bottom: 10px;">
                            	<div class="progress" style="height: 10px;">
								  <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40"
  											aria-valuemin="0" aria-valuemax="100" style="width:40%" >  										
  									</div>
  							</div>
                        </div><!--/col-->

                        
                        <div class="col-sm-12 col-sm-4" style="padding-top: 180px;">                        
                            
                            <button class="btn btn-info btn-block"><span class="fa fa-user"></span> Edit Profile </button>
                        </div><!--/col-->
                       
              		</div><!--/row-->

    	
   <div class="row">
    	<div class="col-md-12">
            <div class="panel with-nav-tabs panel-default">
                <div class="panel-heading">              
    					<ul id="myTab" class="nav nav-tabs">
						<li class="active"><a href="#tab1default" data-toggle="tab"> Questions </a></li>
						<li><a href="home" data-toggle="tab"> Answers </a></li>
						<li><a href="#" data-toggle="dropdown"> Challenges <span class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="#tab2default" data-toggle="tab">Challenges Posted</a></li>
								<li><a href="#tab3default" data-toggle="tab">Challenges Attended</a></li>
							</ul></li>
						<li><a href="home"> Seminars </a></li>
						</ul>
				</div>
				
                    <div>
    					<div  class="tab-pane fade in active" id="tab1default">
							<table class="table table-hover">
								<thead id="table_head">
									<tr>
										<th style="width: 60%;"><center>Question</center></th>
										<th style="width: 20%;">Posted By</th>
										<th style="width: 20%;">Created On</th>
									</tr>
								</thead>
								<tbody id="table_body">
									<c:forEach items="${userquestion}" var="uq">
										<tr>
										<td><center><a href="answers?qid=${uq.qid}">${uq.qtitle}</a></center></td>
										<td style="width: 10%;">${uq.userName}</td>
										<td style="width: 10%;">${uq.qtimestamp}</td>
										</tr>
									</c:forEach>
								</tbody>
	 						</table>
	 					</div>
	 					<div  class="tab-pane fade" id="tab2default">
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
									<c:forEach items="${userPostedChallenges}" var="upc">
										<tr>
										<td><center>
											<c:choose>
												<c:when test="${upc.challengeStatus == 0}">	
													<a href="challengeq?challengeID=${upc.challengeID}">${upc.title}</a>
												</c:when>
												<c:when test="${upc.challengeStatus == 1}">	
													<a href="challengeq?challengeID=${upc.challengeID}">${upc.title}</a>
												</c:when>
												<c:otherwise>
													<a href="challengec?challengeID=${upc.challengeID}">${upc.title}</a>
												</c:otherwise>
											</c:choose>
										</center></td>
										<td style="width: 10%;">${upc.hostUser}</td>
										<td style="width: 10%;">${upc.startTime}</td>
										<td style="width: 10%;">${upc.points}</td>
										</tr>
									</c:forEach>
								</tbody>
	 						</table>
	 					</div>
	 					<div  class="tab-pane fade" id="tab3default">
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
	 					</div>
	 			 </div>
	 			
	 		</div>
	 	</div>
	 </div>
</div>

</body>


</html>