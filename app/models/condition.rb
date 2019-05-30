class Condition < ApplicationRecord
  has_many :study_conditions
  has_many :studies, through: :study_conditions

  def find_condition
  	self.condition_id
  end

  def find_study_id
  	StudyCondition.find_by(condition_id: find_condition).study_id
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
end
