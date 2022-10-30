class CreateChatRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :chat_rooms do |t|
      t.integer :user_id
      t.integer :trainer_id
      t.integer :room_id

      t.timestamps
    end
  end
end
