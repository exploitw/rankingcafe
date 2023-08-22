function validateCafe() {
    if (!$('#name').val()) {
        throw 'nameRequired';
    }
}

function updateReview(event) {
    try {
        validateCafe();

        $('#review_form_action').val('updateReview');
       
        $('#review_form')[0].submit();
    } catch (e) {
        switch (e) {
            case 'nameRequired':
                alert('이름을 입력해 주십시오.');
                break;
        }
        event.preventDefault();
    }
}

function deleteReview() {
    $('#review_form_action').val('deleteReview');
    $('#review_form')[0].submit();
}

$(function () {
    $('#update_button').click(updateReview);
    $('#delete_button').click(deleteReview);
});

