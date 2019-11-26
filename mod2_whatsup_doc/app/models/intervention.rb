class Intervention < ApplicationRecord

  has_and_belongs_to_many :studies



  def find_studies
    self.studies
  end

  def study_id
    self.find_studies.map {|study| study.id }[0]
  end

  def study_name
    self.find_studies.map {|study| study.BRIEF_TITLE }[0]
  end

  def find_study
    Study.find(study_id)
  end

  def find_condition
    self.find_study.conditions.ids
  end

  def condition
    conditions = find_study.conditions
    conditions[0].CONDITION
  end
end
