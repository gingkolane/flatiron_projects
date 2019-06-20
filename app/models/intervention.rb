class Intervention < ApplicationRecord

  has_many :interventions_studies
  has_many :studies, through: :interventions_studies

  has_many :conditions, through: :studies
  has_many :investigators, through: :studies
  has_many :sponsors, through: :studies
end
