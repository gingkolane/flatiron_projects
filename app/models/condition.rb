class Condition < ApplicationRecord
  has_and_belongs_to_many :studies


  # def find_study_id
  # 	StudyCondition.find_by(condition_id: find_condition).study_id
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
