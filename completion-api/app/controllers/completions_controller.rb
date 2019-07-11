class CompletionsController < ApplicationController
  before_action :set_completion, only: [:show, :update, :destroy]
  # skip_before_action :verify_authenticity_token

  def index
    @completions = Completion.all

    render json: @completions, include: [:repo, :user]
  end

  def show
    render json: @completion, include: [:repo, :user]

  end

  # POST /completions
  def create
    @completion = Completion.new(completion_params)
    # byebug
    if @completion.save
      render json: @completion, include: [:repo, :user], status: :created, location: @completion
    else
      render json: @completion.errors, status: :unprocessable_entity
    end
  end


  def update
    if @completion.update(completion_params)
      render json: @completion
    else
      render json: @completion.errors, status: :unprocessable_entity
    end
  end

  # DELETE /completions/1
  def destroy
    @completion.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_completion
      @completion = Completion.find(params[:id])
    end

    def completion_params
      params.require(:completion).permit(:repo_id, :user_id, :incompleteReason, :issueType, :problemAnalysis, :suggestedFix, :status )
    end
end

