class CreateRepos < ActiveRecord::Migration[5.2]
  def change
    create_table :repos do |t|
      t.string :name
      t.integer :github_repo_id
      t.string :html_url

      t.timestamps
    end
  end
end
