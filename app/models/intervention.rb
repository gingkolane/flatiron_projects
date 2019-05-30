class Intervention < ApplicationRecord
  has_many :study_interventions
  has_many :studies, through: :study_interventions

  def find_intervention
  	self.intervention_id
  end

  # def find_study_id
  # 	StudyIntervention.find_by(intervention_id: find_intervention).study_id
  # end

  # def find_study
  # 	Study.find_by(study_id: find_study_id)
  # end

  # def study_title
  # 	find_study.BRIEF_TITLE
  # end

  # def study_summary
  # 	find_study.BRIEF_SUMMARY
  # end
end
