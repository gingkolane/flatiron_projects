class Investigator < ApplicationRecord

  has_many :investigators_studies
  has_many :studies, through: :investigators_studies

end
