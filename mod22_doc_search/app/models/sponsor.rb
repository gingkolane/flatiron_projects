class Sponsor < ApplicationRecord

  has_many :sponsors_studies
  has_many :studies, through: :sponsors_studies
  
end
