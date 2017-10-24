$(document).on "turbolinks:load", ->

  messages = document.querySelector("[data-behavior='messages']")
  messages.scrollTop = messages.scrollHeight - messages.clientHeight if messages

  user = $("meta[data-current-user]").data("current-user")
  $("[data-message-user='#{user}']").addClass "is-offset-8 has-text-right"
  $("[data-message-user='#{user}']").children().addClass "primary"
  $("[data-message-user='#{user}']").children().children().addClass "has-text-white border-dark"

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