class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :password
      t.string :password_confirm
      t.string :password_digest

      t.timestamps
    end
  end
end