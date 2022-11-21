class Interest < ApplicationRecord
  belongs_to :user
  belongs_to :trainer, class_name: "User"
end
