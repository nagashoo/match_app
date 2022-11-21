class User < ApplicationRecord
  has_many :reactions
  has_many :chat_rooms
  has_many :rooms, through: :chat_rooms
  has_many :chats

  validates :name, { presence: true }
  validates :email, { presence: true, uniqueness: true }
  validates :password, { presence: true }
  validates :is_trainer, inclusion: [true, false]

  scope :trainers, -> { where(is_trainer: true) }
  scope :trainees, -> { where(is_trainer: false) }
end
