$(document).on "turbolinks:load", ->

  current_user = $("meta[data-current-user]").data("current-user")
  $("[data-message-user='#{current_user}']").addClass "has-text-right"

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