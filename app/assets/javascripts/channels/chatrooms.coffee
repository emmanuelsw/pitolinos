App.chatrooms = App.cable.subscriptions.create "ChatroomsChannel",
  connected: ->

  disconnected: ->

  received: (data) ->

    active_chatroom = $("[data-behavior='messages'][data-chatroom-id='#{data.chatroom_id}']")

    if active_chatroom.length > 0
      active_chatroom.append(data.message)
    else
      $("[data-behavior='chatroom-link'][data-chatroom-id='#{data.chatroom_id}']").css("font-weight", "bold")

    current_user = $("meta[data-current-user]").data("current-user")
    $("[data-message-user='#{current_user}']").addClass "is-offset-8 has-text-right"
    $("[data-message-user='#{current_user}']").children().addClass "primary"
    $("[data-message-user='#{current_user}']").children().children().addClass "has-text-white border-dark"

    message_body = document.querySelector("[data-behavior='messages']");
    message_body.scrollTop = message_body.scrollHeight - message_body.clientHeight;

  send_message: (chatroom_id, message) ->
    @perform "send_message", {chatroom_id: chatroom_id, body: message}