class Room < ApplicationRecord
  has_many :chat_rooms
  #has_many :messages
  has_many :chats
  has_many :users, through: :chat_rooms
  has_many :trainers, through: :chat_rooms
end
