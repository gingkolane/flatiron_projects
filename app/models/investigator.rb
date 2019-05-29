class Investigator < ApplicationRecord
  has_many :study_investigators
  has_many :studies, through: :study_investigators
end
