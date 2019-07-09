class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.integer :github_user_id
      t.string :login
      t.string :avatar_url
      t.string :html_url

      t.timestamps
    end
  end
end
