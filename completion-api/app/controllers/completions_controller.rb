class CompletionsController < ApplicationController
  before_action :set_completion, only: [:show, :update, :destroy]

  # GET /completions
  def index
    @completions = Completion.all

    render json: @completions
  end

  # GET /completions/1
  def show
    render json: @completion
  end

  # POST /completions
  def create
    @completion = Completion.new(completion_params)
    byebug
    if @completion.save
      render json: @completion, status: :created, location: @completion
    else
      render json: @completion.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /completions/1
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

    # Only allow a trusted parameter "white list" through.
    def completion_params
      params.require(:completion).permit(:repo_id, :user_id)
    end
end
