function validateComment() {
  if (!$("#content").val()) {
    throw "contentRequired";
  }
}

function addComment(event) {
	event.preventDefault();
	try {
		validateComment();

		$("#comment_form_action").val("addComment");
		$("#comment_form")[0].submit();
	} catch (e) {
		switch (e) {
			case "contentRequired":
				alert("내용을 입력해 주십시오.");
				break;
		}
	}
}

function updateComment(event) {
  event.preventDefault();
  try {
    validateComment();

    $("#comment_form_action").val("updateComment");
    $("#comment_form")[0].submit();
  } catch (e) {
    switch (e) {
      case "contentRequired":
        alert("내용을 입력해 주십시오.");
        break;
    }
  }
}

function deleteComment() {
  $("#comment_form_action").val("deleteComment");
  $("#comment_form")[0].submit();
}

$(function () {
  $("#insertComment_button").click(addComment);
  $("#updateComment_button").click(updateComment);
  $("#deleteComment_button").click(deleteComment);
});