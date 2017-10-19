$(document).on "turbolinks:load", ->

  message_body = document.querySelector("[data-behavior='messages']");
  message_body.scrollTop = message_body.scrollHeight - message_body.clientHeight;

  current_user = $("meta[data-current-user]").data("current-user")
  $("[data-message-user='#{current_user}']").addClass "is-offset-8 has-text-right"
  $("[data-message-user='#{current_user}']").children().addClass "primary"
  $("[data-message-user='#{current_user}']").children().children().addClass "has-text-white border-dark"

  $("#new_message").on "keypress", (e) ->
    if e && e.keyCode == 13
      e.preventDefault()
      $(this).submit() unless $("#chat_input").val() == ''

  $("#new_message").on "submit", (e) ->
    e.preventDefault()

    chatroom_id = $("[data-behavior='messages']").data("chatroom-id")
    body        = $("#chat_input")

    App.chatrooms.send_message(chatroom_id, body.val())
    body.val("")