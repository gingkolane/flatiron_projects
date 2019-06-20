class ConditionsController < ApplicationController
  before_action :set_condition, only: [:show, :edit, :update, :destroy]

  def index
    @conditions = Condition.all
  end

  def show
  end

  private
    def set_condition
      @condition = Condition.find(params[:id])
    end

    def condition_params
      params.require(:condition).permit(:CONDITION)
    end
end
