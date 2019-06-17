class Condition < ApplicationRecord

  has_many :conditions_studies
  has_many :studies, through: :conditions_studies
end
