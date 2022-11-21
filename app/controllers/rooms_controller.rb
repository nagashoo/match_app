class RoomsController < ApplicationController

  def show
    trainer = User.trainers.find_by(id: interest.trainer_id) 
    @room = Room.find(params[:id])
    @chat_room = @room.chat_rooms.where(trainer_id: trainer.id)
    @chats = Chat.where(room: @room)
    
    @chat = Chat.new(room_id: @room.id)
  end

  def create
    current_user_rooms = ChatRoom.where(user_id: @current_user.id).map(&:room)
    room = ChatRoom(room: current_user_rooms, trainer_id: params[:trainer_id]).map(&:room).first
    if room.blank
      room = Room.create
      ChatRoom.create(chat: chat, user_id: current_user.id)
      ChatRoom.create(chat: chat, trainer_id: params[:trainer_id])
    end
    redirect_to("/rooms/:id")
  end

end
