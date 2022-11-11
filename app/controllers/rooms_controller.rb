class RoomsController < ApplicationController

  def show
    @room = Room.find(params[:id])
    @chat_room = @room.chat_rooms.where.not(user_id: @current_user.id)
    @chats = Chat.where(room: @room)

    #rooms = @current_user.chat_rooms.pluck(:room_id)
    #chat_rooms = ChatRoom.find_by(trainer_id: @trainer.id, room_id: rooms)
    #if chat_rooms
      #@room = chat_rooms.room
    #else
      #@room = Room.new
      #@room.save
      #ChatRoom.create(user_id: @current_user.id, room_id: @room.id)
      #ChatRoom.create(trainer_id: @trainer.id,  room_id: @room.id)
    #end
    #@chats = @room.chats
    #@chat = Chat.new(room_id: @room.id)

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
