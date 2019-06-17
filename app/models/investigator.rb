class Investigator < ApplicationRecord

  has_many :investigators_studies
  has_many :studies, through: :investigators_studies

  has_many :investigators_lists
  has_many :lists, through: :investigators_lists

end
