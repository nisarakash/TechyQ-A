function searchQuestion() {
  var topic = document.getElementById("topic").value;
  var url = 'question';
  var form = $('<form action="' + url + '" method="post">' +
    '<input type="text" name="topic" value="' + topic + '" />' +
    '</form>');
  form.submit();
}
