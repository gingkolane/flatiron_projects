class Condition < ApplicationRecord
  has_many :study_conditions
  has_many :studies, through: :study_conditions
end
