class SponsorsController < ApplicationController
  before_action :set_sponsor, only: [:show, :edit, :update, :destroy]

  def index
    @sponsors = Sponsor.all
  end

  def show
  end

  private
    def set_sponsor
      @sponsor = Sponsor.find(params[:id])
    end

    def sponsor_params
      params.require(:sponsor).permit(:AGENCY, :SPONSOR_TYPE, :AGENCY_CLASS, :NCT_ID)
    end
end
