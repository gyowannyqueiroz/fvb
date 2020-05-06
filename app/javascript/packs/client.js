// show/hide parent select based on parent checkbox
$("#client_parent").on('change', function () {
    if ($("#client_parent").is(":checked")) {
        $("#client_parent_client_id").val('');
    }
    $('#parent_client_select').toggle();
});
