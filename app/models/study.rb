class Study < ApplicationRecord

  has_many :conditions_studies
  has_many :conditions, through: :conditions_studies

  has_many :interventions_studies
  has_many :interventions, through: :interventions_studies

  has_many :investigators_studies
  has_many :investigators, through: :investigators_studies
  
  has_many :sponsors_studies
  has_many :sponsors, through: :sponsors_studies

end
