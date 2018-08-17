App.play = App.cable.subscriptions.create "PlayChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    roomId = $('#room_id').data('room')
    if roomId 
      @perform 'checkIn',room_id: roomId
    else
      @perform 'checkOut'

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    video.play()
    show_pause_button()