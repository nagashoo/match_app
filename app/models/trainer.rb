class Trainer < ApplicationRecord
  validates :name, {presence: true}
  validates :email, {presence: true, uniqueness: true}
  validates :password, {presence: true}

  #has_many :rooms, through: chat_rooms
  has_many :chat_rooms, dependent: :destroy
  has_many :chats, dependent: :destroy
end
