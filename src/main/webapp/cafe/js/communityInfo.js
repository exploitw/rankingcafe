function validateCommunity() {
	if (!$('#title').val()) {
		throw 'titleRequired';
	} else if (!$('#content').val()) {
		throw 'contentRequired';
	}
}

function updateCommunity(event) {
			event.preventDefault();
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
	}
}

function deleteCommunity() {
	$('#community_form_action').val('deleteCommunity');
	$('#community_form')[0].submit();
}

$(function() {
	$('#updateCommunity_button').click(updateCommunity);
	$('#deleteCommunity_button').click(deleteCommunity);
});