class MessagesController < ApplicationController
  def create
    @message = current_user.messages.create(room: current_room,message: params[:message])
    ActionCable.server.broadcast "messages_room_#{current_room.id}",(render partial:"messages/create")
  end
end
