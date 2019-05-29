class RenameStudiesInvestigatorsToStudyInvestigators < ActiveRecord::Migration[5.2]
  def change
  	rename_table :studies_investigators, :study_investigators
  end
end
