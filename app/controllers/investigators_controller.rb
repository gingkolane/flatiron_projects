class InvestigatorsController < ApplicationController
  before_action :set_investigator, only: [:show, :edit, :update, :destroy]

  def index
    @list = @current_user.lists.new
    if params[:search_by_name]
      @investigators = Investigator.where("NAME_DEGREE like ?", "%#{params[:search_by_name]}%")
    elsif params[:search_by_condition]
      @investigators = Investigator.find_by_condition(params[:search_by_condition])
    else
      @investigators = Investigator.all.first(50)
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
