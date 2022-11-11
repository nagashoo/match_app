class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    Chat.create!(
      content: data['chat'],
      user_id: current_user.id,
      trainer_id: trainer.id,
      room_id: data['room_id']
    )
  end
end
