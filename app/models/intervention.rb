class Intervention < ApplicationRecord
  has_many :study_interventions
  has_many :studies, through: :study_interventions
end
