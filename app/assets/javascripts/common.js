$(function() {
  $("a[data-target='#modal']").click(function(ev) {
    ev.preventDefault();
    var target = $(this).attr("href");

    // load the url and show modal on success
    $("#modal .modal").load(target, function() {
      $("#modal").modal("show");
    });
  });
  $(document.body).off('hide.bs.modal', '.modal');
  $(document.body).on('hide.bs.modal', '.modal', function () {
    var modal = $(this);
    modal.removeData('bs.modal');
    modal.find('#modal_content').html('');
  });
  // Modal Callbacks End

  $('#loading-indicator').hide();

  // Init Tooltips
  $('[data-toggle="tooltip"]').tooltip();
});
function display_success_msg(msg) {
    $('#success_div').text(msg).show().delay(2000).fadeOut();
}
function display_error_msg(msg) {
    $('#error_div').text(msg).show().delay(2000).fadeOut();
}