class ReposController < ApplicationController
  before_action :set_repo, only: [:show, :update, :destroy]

  def index
    @repos = Repo.all
    render json: @repos
  end

  def show
    render json: @repo
  end

  def create
    @repo = Repo.new(repo_params)
    @repo.save
    render json: @repo, status: :created, location: @repo
  end

  def update
    @repo.update(repo_params)
    render json: @repo
  end

  def destroy
    @repo.destroy
  end 

  private
    def set_repo
      @repo = Repo.find(params[:id])
    end

    def repo_params
      params.require(:repo).permit(:name, :github_repo_id, :html_url)
    end
end
