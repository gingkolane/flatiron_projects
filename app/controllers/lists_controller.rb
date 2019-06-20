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
    # create investigator_lists with this @list.id
    @investigators = params[:list][:investigator_ids].map {|id| id.to_i }

    @investigators.each do |investigator|
      # make one listitem each cycle
      InvestigatorsList.create(list_id: @list.id, investigator_id: investigator)
    end

    redirect_to @list,  notice: "#{@list.name} was successfully created."
  end


  # PATCH/PUT /lists/1
  # PATCH/PUT /lists/1.json
  def update
    @list = List.find(params[:id])
    @list.update(list_params)
    redirect_to @list, notice: 'List was successfully updated.'

  end


  # def add_to_list
  # end

  # DELETE /lists/1
  # DELETE /lists/1.json
  def destroy
    @list.destroy
    respond_to do |format|
      format.html { redirect_to lists_url, notice: 'List was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def find_list
      @list = List.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_params
      params.require(:list).permit(:name, :user_id, :investigator_ids)
    end


end
