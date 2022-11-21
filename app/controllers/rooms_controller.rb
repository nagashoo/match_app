class RoomsController < ApplicationController
  before_action :authenticate_user!

  def show
    trainer = User.trainers.find_by(id: params:[:id])
    @room = Room.find(params[:id])
    @chat_room = @room.chat_rooms.where.not(user_id: current_user.id).first.user
    @chats = Chat.where(room: @room)
  end

  def create
    current_user_rooms = ChatRoom.where(user_id: @current_user.id).map(&:room)
    room = ChatRoom(room: current_user_rooms, trainer_id: params[:trainer_id]).map(&:room).first
    if room.blank?
      room = Room.create
      ChatRoom.create(chat: chat, user_id: current_user.id)
      ChatRoom.create(chat: chat, trainer_id: params[:trainer_id])
    end
    redirect_to("/rooms/:id")
  end

end
