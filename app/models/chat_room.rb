class ChatRoom < ApplicationRecord
  belongs_to :room
  belongs_to :user
  belongs_to :trainer, class_name: "User"
end
