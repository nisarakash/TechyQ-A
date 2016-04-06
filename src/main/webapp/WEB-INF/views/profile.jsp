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

    
    
  </div>
</div>

</body>
</html>