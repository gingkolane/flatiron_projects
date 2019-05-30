class Study < ApplicationRecord

	has_and_belongs_to_many :conditions
	has_and_belongs_to_many :interventions
	has_and_belongs_to_many :investigators
	has_and_belongs_to_many :sponsors

	belongs_to :sponsor
	belongs_to :investigator
  # has_many :study_conditions
  # has_many :conditions, through: :study_conditions


	# def find_study_id
	# 	self.study_id
	# end

	# def find_conditions
	# 	StudyCondition.find_by(study_id: find_study_id).condition.CONDITION
	# end 

	# def find_investigators
	# 	StudyInvestigator.find_by(study_id: find_study_id).investigator.NAME_DEGREE
	# end

	# def find_interventions
	# 	StudyIntervention.find_by(study_id: find_study_id).intervention.INTERVENTION_NAME
	# end

end
