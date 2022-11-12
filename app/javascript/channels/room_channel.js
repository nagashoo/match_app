import consumer from "./consumer"

const appRoom = consumer.subscriptions.create("RoomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    const Chats = document.getElementById('chat-messages');
    Chats.insertAdjacentHTML('beforeend', data['chat']);
    return alert(data['chat']);
  },

  speak: function(chat, room_id) {
    return this.perform('speak', {chat: chat, room_id: room_id});
  }
});

if(/rooms/.test(location.pathname)) {
  $(document).on("keydown", ".chat-room__message-form_textarea", function(e) {
    if (e.key === "Enter") {
      const room_id = $('textarea').data('room_id')
      appRoom.speak(e.target.value, room_id);
      e.target.value = '';
      e.preventDefault();
    }
  })
}