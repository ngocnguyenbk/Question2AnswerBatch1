class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password
      t.integer :role
      t.string :fullname

      t.timestamps
    end
  end
end
