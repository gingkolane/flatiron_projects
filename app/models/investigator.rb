class Investigator < ApplicationRecord

  has_many :investigators_studies
  has_many :studies, through: :investigators_studies

  has_many :investigators_lists
  has_many :lists, through: :investigators_lists

  has_many :conditions, through: :studies
  has_many :interventions, through: :studies
  has_many :sponsors, through: :studies

  def specialty_diseases
    conditionArray = conditions.map {|condition| condition.CONDITION}
    conditionString = conditionArray.join(', ')
  end 

  def self.find_by_condition(input)
    conditionArr = Condition.where(CONDITION: input)
    conditionArr.first.investigators
  end 

  def self.find_by_city(input)
    conditionArr = Condition.where(CONDITION: input)
    conditionArr.first.investigators
  end 

  def self.new_york_doctors
    Investigator.where(CITY: "New York")
  end 

  def self.sloan_kettering_doctors
    Investigator.where(FACILITY_NAME: "Memorial Sloan Kettering Cancer Center")
  end 

end
