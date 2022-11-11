class Trainer < ApplicationRecord
  validates :email, {uniqueness: true}

  #has_many :rooms, through: chat_rooms
  has_many :chat_rooms, dependent: :destroy
  has_many :chats, dependent: :destroy
end
