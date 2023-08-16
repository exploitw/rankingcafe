function validateCommunity() {
    if (!$('#title').val()) {
        throw 'titleRequired';
    }
    if (!$('#customerId').val()) {
        throw 'customerIdRequired';
    }
}

function updateBook(event) {
    try {
        validateCommunity();

        $('#community_form_action').val('updateCommunity');
        $('community_form')[0].submit();
    } catch (e) {
        switch (e) {
            case 'titleRequired':
                alert('제목을 입력해 주십시오.');
                break;
        }
        event.preventDefault();
    }
}

function deleteBook() {
    $('#community_form_action').val('deleteCommunity');
    $('#community_form')[0].submit();
}

$(function () {
    $('#update_button').click(updateBook);
    $('#delete_button').click(deleteBook);
});