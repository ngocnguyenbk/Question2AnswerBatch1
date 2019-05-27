class RemoveToUsers < ActiveRecord::Migration[5.1]
  def change
  	remove_column :users, :activated, :activated_at
  end
end
