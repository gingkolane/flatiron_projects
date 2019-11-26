class InterventionsController < ApplicationController
  before_action :set_intervention, only: [:show, :edit, :update, :destroy]

  def index
    @interventions = Intervention.all
  end

  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intervention
      @intervention = Intervention.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def intervention_params
      params.require(:intervention).permit(:INTERVENTION_NAME, :INTERVENTION_TYPE, :DESCRIPTION)
    end
end
