class Investigator < ApplicationRecord
  has_many :study_investigators
  has_many :studies, through: :study_investigators



  def find_investigator
  	self.investigator_id
  end

  def find_study_id
  	StudyInvestigator.find_by(investigator_id: find_investigator).study_id
  end

  def find_study
  	Study.find_by(study_id: find_study_id)
  end

  def study_title
  	find_study.BRIEF_TITLE
  end

  def study_summary
  	find_study.BRIEF_SUMMARY
  end

  def find_conditions
  	StudyCondition.find_by(study_id: find_study_id).condition.CONDITION
  end

  def find_interventions
  	StudyIntervention.find_by(study_id: find_study_id).intervention.INTERVENTION_NAME
  end


end
