class Investigator < ApplicationRecord

  has_many :investigators_studies
  has_many :studies, through: :investigators_studies

  has_many :investigators_lists
  has_many :lists, through: :investigators_lists

  def self.new_york_doctors
    Investigator.where(CITY: "New York")
  end 

  def self.sloan_kettering_doctors
    Investigator.where(FACILITY_NAME: "Memorial Sloan Kettering Cancer Center")
  end 
    
  # def specialty_disease
  #   @investigator = Investigator.find(param[:id])


  # def add_investigator
  #   @investigator =  

  def select_investigator

    if @can_add
      @selected_investigator = Investigator.create(color_id: params[:color_id], user: @current_user)
      @selected_investigator = Investigator.create(color_id: params[:color_id], user: @current_user)
   
      selected_investigator_ids= [];
      @investigator.id 

      session[:selected_investigator] = 
      flash["messages"] = "You have successfully voted!"
    else
      flash["messages"] = "Too bad. You ran out of votes!"
    end
    redirect_to investigators_path
  end
  

end
