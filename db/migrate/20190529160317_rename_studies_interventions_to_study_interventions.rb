class RenameStudiesInterventionsToStudyInterventions < ActiveRecord::Migration[5.2]
  def change
  	rename_table :studies_interventions, :study_interventions
  end
end
