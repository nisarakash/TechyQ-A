function searchQuestion() {
	var topic = document.getElementById("topic").value;
	var url = 'question';
	var form = $('<form action="' + url + '" method="post">'
			+ '<input type="text" name="topic" value="' + topic + '" />'
			+ '</form>');
	$('body').append(form);
	form.submit();
}

function incrCount(btn) {
	var url = 'challengeVote';
	var challengeId = document.getElementById("challengeId").value;
	var form = $('<form action="' + url + 	'" method="post">'
			+ '<input type="text" name="vote" value="' + btn + '" />'
			+ '<input type="text" name="challengeid" value="' + challengeId
			+ '" />' + '</form>');
	$('body').append(form);
	form.submit();
}

function videoVote(videoId) {
	var url = 'videoVoteUpdate';
	var form = $('<form action="' + url + 	'" method="post">'
			+ '<input type="text" name="videoId" value="' + videoId + '" />'
			+ '</form>');
	$('body').append(form);
	form.submit();
}