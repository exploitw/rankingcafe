function validateCustomer() {
    if (!$('#name').val()) {
        throw 'nameRequired';
    }
}

function updateAdmin(event) {
    try {
        validateCustomer();

        $('#admin_form_action').val('updateAdmin');
        $('#admin_form')[0].submit();
    } catch (e) {
        switch (e) {
            case 'nameRequired':
                alert('이름을 입력해 주십시오.');
                break;
        }
        event.preventDefault();
    }
}

function deleteAdmin() {
    $('#admin_form_action').val('deleteAdmin');
    $('#admin_form')[0].submit();
}

$(function () {
    $('#updateAdmin_button').click(updateAdmin);
    $('#deleteAdmin_button').click(deleteAdmin);
});