class Trainer < ApplicationRecord
  validates :email, {uniqueness: true}
end
