class AddColumnIsTrainerToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :is_trainer, :boolean, default: false, null: false
  end
end
