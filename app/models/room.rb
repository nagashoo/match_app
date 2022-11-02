class Room < ApplicationRecord
  has_many :users, through :chat_rooms
  has_many :trainers, through :chat_rooms
  has_many :chat_rooms, dependent :destroy
  has_many :chats, dependent :destroy
end
