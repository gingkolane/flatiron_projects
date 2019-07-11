class CompletionsController < ApplicationController
  before_action :set_completion, only: [:show, :update, :destroy]

  def index
    @completions = Completion.all
    render json: @completions, include: [:repo, :user]
  end

  def show
    render json: @completion, include: [:repo, :user]
  end

  def create
    @completion = Completion.new(completion_params)
    @completion.save

    render json: @completion, include: [:repo, :user], status: :created, location: @completion
  end

  def update
    @completion.update(completion_params)
    render json: @completion
  end

  private
    def set_completion
      @completion = Completion.find(params[:id])
    end

    def completion_params
      params.require(:completion).permit(:repo_id, :user_id, :incompleteReason, :issueType, :problemAnalysis, :suggestedFix, :status )
    end
end

