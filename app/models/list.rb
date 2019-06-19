class List < ApplicationRecord
  belongs_to :user

  has_many :investigators_lists
  has_many :investigators, through: :investigators_lists
  
  def new_york_doctor_list
    @list = Investigator.where(CITY: "New York")
  end 


  def US_doctor_list
    @lists = List.all
  end 

  
end
