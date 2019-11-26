class ListsController < ApplicationController
  before_action :find_list, only: [:show, :edit, :update, :destroy]

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @list.investigators
  end

  def new
    @list = List.new
  end

  def edit
  end

  def create
    # create a new list with a list name and a user_id
    @list = List.create(name: list_params[:name], user_id: @current_user.id)
    # create investigators with these nested list_params. Have to convert to integer because params are all strings
    @investigators = params[:list][:investigator_ids].map {|id| id.to_i }

    @investigators.each do |investigator|
      # make one listitem each cycle
      InvestigatorsList.create(list_id: @list.id, investigator_id: investigator)
    end

    redirect_to @list,  notice: "#{@list.name} was successfully created."
  end


  def update
    @list = List.find(params[:id])
    @list.update(list_params)
    redirect_to @list, notice: 'List was successfully updated.'

  end

  def destroy
    @list.destroy
    redirect_to lists_url, notice: 'List was successfully destroyed.' 
  end

  private
    def find_list
      @list = List.find(params[:id])
    end

    def list_params
      params.require(:list).permit(:name, :user_id, :investigator_ids)
    end
    
end
