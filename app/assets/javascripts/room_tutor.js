$(function() {
  $('#new_room_tutor_msg').on('ajax:success', function(a, b,c ) {
    $(this).find('input[type="text"]').val('');
  });
});
