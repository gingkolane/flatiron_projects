class InvestigatorsController < ApplicationController
  before_action :set_investigator, only: [:show, :edit, :update, :destroy]

  def index
    @list = @current_user.lists.new
    @investigators = Investigator.all
    if params[:search_by_condition] && params[:search_by_condition] != ""
      @investigators = @investigators.find_by_condition(params[:search_by_condition])
    end 

    if params[:search_by_name] && params[:search_by_name] != ""
      @investigators = @investigators.where("NAME_DEGREE like ?", "%#{params[:search_by_name]}%")
    end 

    if params[:search_by_city] && params[:search_by_city] != ""
      @investigators = @investigators.where("CITY like ?", "#{params[:search_by_city]}")
    end

    if params[:search_by_name] != "" && params[:search_by_condition] != "" && params[:search_by_city] != ""
      @investigators = @investigators.first(50)
    end 

  end

  

  def show
  end

  private
    def set_investigator
      @investigator = Investigator.find(params[:id])
    end

    def investigator_params
      params.require(:investigator).permit(:NAME_DEGREE, :ROLE, :FACILITY_NAME, :CITY, :STATE, :ZIP, :COUNTRY)
    end
end
