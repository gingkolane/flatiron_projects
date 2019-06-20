class InvestigatorsController < ApplicationController
  before_action :set_investigator, only: [:show, :edit, :update, :destroy]

  def index
    @list = @current_user.lists.new
    if params[:search]
      @investigators = Investigator.where("NAME_DEGREE like ?", "%#{params[:search]}%")
      # @investigators = Investigator.where(name: params[:search])
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
