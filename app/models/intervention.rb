class Intervention < ApplicationRecord

  has_many :interventions_studies
  has_many :studies, through: :interventions_studies

  has_many :conditions, through: :studies
end
