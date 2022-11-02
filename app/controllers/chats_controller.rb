class ChatsController < ApplicationController

  def show
    @trainer = Trainer.find_by(id: params[:id])
    rooms = @current_user.chat_rooms.pluck(:room_id)
    chat_rooms = ChatRoom.find_by(trainer_id: @trainer.id, room_id: rooms)
    if user_rooms
      @room = chat_rooms.room
    else
      @room = Room.new
      @room.save
      ChatRoom.create(user_id: current_user.id, room_id: @room.id)
      ChatRoom.create(trainer_id: @trainer.id,  room_id: @room.id)
    end
    @chats = @room.chats
    @chat = Chat.new(room_id: @room.id)
  end

  def create
    @chat = Chat.new(
      user_id: @current_user.id,
      trainer_id: params[:trainer_id],
      room_id: params[:room_id],
      message: params[:message]
    )
    if @chat.save
      flash[:notice] = "チャットを送信しました"
    else
      flash[:notice] = "送信に失敗しました"
    end
  end

end
