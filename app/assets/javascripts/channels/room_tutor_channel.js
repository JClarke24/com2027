$(function() {
  $('[data-channel-subscribe="roomtutor"]').each(function(index, element) {
    var $element = $(element),
        roomtutor_id = $element.data('room-tutor-id')
        messageTemplate = $('[data-role="message-template"]');

    $element.animate({ scrollTop: $element.prop("scrollHeight")}, 1000)

    App.cable.subscriptions.create(
      {
        channel: "RoomTutorChannel",
        room: str(roomtutor_id)
      },
      {
        received: function(data) {
          var content = messageTemplate.children().clone(true, true);
          content.find('[data-role="message-text"]').text(data.message);
          content.find('[data-role="message-date"]').text(data.updated_at);
          content.find('[data-role="message-tutor-forename"]').text(data.tutor_id);
          $element.append(content);
          $element.animate({ scrollTop: $element.prop("scrollHeight")}, 1000);
        }
      }
    );
  });
});
