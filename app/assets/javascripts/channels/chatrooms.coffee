App.chatrooms = App.cable.subscriptions.create "ChatroomsChannel",
  connected: ->

  disconnected: ->

  received: (data) ->

    active_chatroom = $("[data-behavior='messages'][data-chatroom-id='#{data.chatroom_id}']")

    if active_chatroom.length > 0
      active_chatroom.append(data.message)
    else
      $("[data-behavior='chatroom-link'][data-chatroom-id='#{data.chatroom_id}']").css("font-weight", "bold")

    user = $("meta[data-current-user]").data("current-user")
    $("[data-message-user='#{user}']").addClass "is-offset-8 has-text-right"
    $("[data-message-user='#{user}']").children().addClass "primary"
    $("[data-message-user='#{user}']").children().children().addClass "has-text-white border-dark"

    messages = document.querySelector("[data-behavior='messages']");
    messages.scrollTop = messages.scrollHeight - messages.clientHeight;

  send_message: (chatroom_id, message) ->
    @perform "send_message", {chatroom_id: chatroom_id, body: message}