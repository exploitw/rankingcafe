function validateCommunity() {
	if (!$('#title').val()) {
		throw 'titleRequired';
	} else if (!$('#content').val()) {
		throw 'contentRequired';
	} else if (!$('#img').val()) {
		throw 'imgRequired';
	}
}

function updateCommunity(event) {
	try {
		validateCommunity();

		$('#community_form_action').val('updateCommunity');
		$('#community_form')[0].submit();
	} catch (e) {
		switch (e) {
			case 'titleRequired':
				alert('제목을 입력해 주십시오.');
				break;
			case 'contentRequired':
				alert('내용을 입력해 주십시오.');
				break;
		}
		event.preventDefault();
	}
}

function deleteCommunity() {
	$('#community_form_action').val('deleteCommunity');
	$('#community_form')[0].submit();
}

$(function() {
	$('#update_button').click(updateCommunity);
	$('#delete_button').click(deleteCommunity);
});