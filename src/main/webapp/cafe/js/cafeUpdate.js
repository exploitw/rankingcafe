function validateCafe() {
    if (!$('#name').val()) {
        throw 'nameRequired';
    }
}

function updateCafe(event) {
    try {
        validateCafe();

        $('#cafe_form_action').val('updateCafe');
       
        $('#cafe_form')[0].submit();
    } catch (e) {
        switch (e) {
            case 'nameRequired':
                alert('이름을 입력해 주십시오.');
                break;
        }
        event.preventDefault();
    }
}

function deleteCafe() {
    $('#cafe_form_action').val('deleteCafe');
    $('#cafe_form')[0].submit();
}

$(function () {
    $('#updatecafe_button').click(updateCafe);
    $('#deletecafe_button').click(deleteCafe);
});

