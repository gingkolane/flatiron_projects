class CreateInvestigatorsLists < ActiveRecord::Migration[5.2]
  def change
    create_table :investigators_lists do |t|
      t.integer :list_id
      t.integer :investigator_id
      t.timestamps
    end
  end
end
