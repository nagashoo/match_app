class AddColumnsToTrainers < ActiveRecord::Migration[7.0]
  def change
    add_column :trainers, :location, :string
    add_column :trainers, :gender, :string
    add_column :trainers, :age, :string
    add_column :trainers, :profile, :text
  end
end
