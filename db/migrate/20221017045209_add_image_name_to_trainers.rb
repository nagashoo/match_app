class AddImageNameToTrainers < ActiveRecord::Migration[7.0]
  def change
    add_column :trainers, :image_name, :string
  end
end
