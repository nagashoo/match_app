class User < ApplicationRecord
  validates :name, {presence: true}
  validates :email, {presence: true, uniqueness: true}
  validates :password, {presence: true}

  has_many :reactions
  has_many :chat_rooms
  has_many :rooms, through: :chat_rooms
  has_many :chats
end
