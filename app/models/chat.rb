class Chat < ApplicationRecord
  belongs_to :user
  belongs_to :trainer
  belongs_to :room
  #validates :message, presence: true

  after_create_commit {ChatBroadcastJob.perform_later self }
end
