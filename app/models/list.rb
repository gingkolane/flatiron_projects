class List < ApplicationRecord
  belongs_to :user

  has_many :investigators_lists
  has_many :investigators, through: :investigators_lists
  
end
