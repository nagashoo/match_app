class ChangeChatRoomUsersChatRooms < ActiveRecord::Migration[7.0]
  def change
    rename_table :chat_room_users, :chat_rooms
  end
end
