class ChatroomsController < ApplicationController
  before_action :set_chatroom, only: [:update, :destroy]

  def index
    @joined_chatrooms = current_user.chatrooms.all
    @other_chatrooms = Chatroom.where.not(id: @joined_chatrooms.pluck(:id))
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)
    @chatroom.save
    redirect_back fallback_location: root_path
  end

  def update
    @chatroom.update(chatroom_params)
  end

  def destroy
    @chatroom.destroy
  end

  private
  def set_chatroom
    @chatroom = Chatroom.find(params[:id])
  end

  def chatroom_params
    params.require(:chatroom).permit(:name)
  end
end
