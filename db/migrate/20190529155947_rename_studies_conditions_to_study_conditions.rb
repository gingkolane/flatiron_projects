class RenameStudiesConditionsToStudyConditions < ActiveRecord::Migration[5.2]
  def change
  	rename_table :studies_conditions, :study_conditions
  end
end