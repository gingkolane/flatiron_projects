class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
  	rename_column :sponsors, :NCT_ID, :study_id
  end
end
