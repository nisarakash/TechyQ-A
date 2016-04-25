<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
	<html>
<head>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link href='resources/css/globalalter.css' rel="stylesheet"
	type="text/css">
<link href='resources/css/fileUpload.css' rel="stylesheet"
	type="text/css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<title>Upload File Request Page</title>
</head>
<body>
	<%@ include file="loginLogoHeader.jsp"%>

	<div class="container"
		style="margin-right: 1%; margin-left: 6%; width: 90%;">
		<br />
		<div style="float: left; width: 80%;">
			<div class="panel-heading">
				<h3>Latest Videos</h3>
			</div>
			<div class="panel-body">
				<c:forEach items="${latestVideo}" var="video">
					<div style="float: left; width: 20%">
						<a href="watchVideo?videoId=${video.videoId}"> <img
							src="${video.thumbnailLocation}" width="200" height="150"
							style="padding: 1%;">
							<center>${video.videoTitle}</center>
						</a>
					</div>
				</c:forEach>

			</div>

		</div>
		<div style="float: right; width: 20%;">
			<div>
				<div class="col-md-13">
					<div class="input-group" id="adv-search" style="float: left;">
						<input type="text" class="form-control" placeholder="Keyword"
							id="topic" />

						<div class="input-group-btn">
							<div class="btn-group" role="group">

								<button type="button" class="btn btn-primary"
									onclick="searchQuestion()">
									<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="panel panel-default" style="margin-top: 30%;">
				<div class="panel-heading">
					<strong>Upload Files</strong>
				</div>
				<div class="panel-body">

					<form action="uploadFile" method="post"
						enctype="multipart/form-data" name="uploadForm"
						id="js-upload-form">
						<!-- <div class="form-inline">
							
						</div> -->
						<div class="form-group">
							<label for="document-name">Title :</label> <input type="text"
								class="form-control" id="document-name" name="videoTitle"
								placeholder="">
						</div>
						<div class="form-group">
							<label for="document-name">Description :</label>
							<textarea rows="4" class="form-control" id="document-name"
								name="videoDesc" placeholder=""></textarea>
						</div>

						<div class="form-group">
							<input type="file" name="file" id="js-upload-files">
						</div>
						<button type="submit" class="btn btn-sm btn-primary"
							id="js-upload-submit">Upload Video</button>
					</form>
					</br>
					<div class="panel-footing">
						<span> Note: Upload .mp4 format vidoes only</span>
						<span> Note: It will take several minutes to upload</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>