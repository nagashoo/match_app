class RemovePrifileFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :prifile, :text
  end
end
