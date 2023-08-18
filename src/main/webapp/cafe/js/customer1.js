function validateCustomer() {
    if (!$('#name').val()) {
        throw 'nameRequired';
    }
}

function updateCustomer(event) {
    try {
        validateCustomer();

        $('#customer_form_action').val('updateCustomer');
        $('#customer_form')[0].submit();
    } catch (e) {
        switch (e) {
            case 'nameRequired':
                alert('이름을 입력해 주십시오.');
                break;
        }
        event.preventDefault();
    }
}

function deleteCustomer() {
    $('#customer_form_action').val('deleteCustomer');
    $('#customer_form')[0].submit();
}

$(function () {
    $('#update_button').click(updateCustomer);
    $('#delete_button').click(deleteCustomer);
});