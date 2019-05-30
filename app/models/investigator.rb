class Investigator < ApplicationRecord

  has_and_belongs_to_many :studies


  # find sponsors this doctor works with 

  #returns an array of sponsor instances
  def sponsors_array
    sponsors_array = []
    self.studies.map do |study| 
    sponsors_array << study.sponsors
    end
    sponsors_array.flatten
  end

  def find_sponsor
    self.sponsors_array.map do |sponsor|
      sponsor.AGENCY
    end
  end 






  # def find_study_id
  # 	StudyInvestigator.find_by(investigator_id: find_investigator).study_id
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

  # def find_conditions
  # 	StudyCondition.find_by(study_id: find_study_id).condition.CONDITION
  # end

  # def find_interventions
  # 	StudyIntervention.find_by(study_id: find_study_id).intervention.INTERVENTION_NAME
  # end


end
