class ListsController < ApplicationController
  before_action :find_list, only: [:show, :edit, :update, :destroy]

  # GET /lists
  # GET /lists.json
  def index
    @lists = List.all
  end

  # GET /lists/1
  # GET /lists/1.json
  def show
    @list = List.find(params[:id])
    @list.investigators 
  end

  # GET /lists/new
  def new
    @list = List.new
    @investigators = Investigator.where(CITY: "New York")
  end

  # GET /lists/1/edit
  def edit
  end

  # POST /lists
  # POST /lists.json
  def create
    # create a new list with a list name and a user_id

    @list = List.create(name: list_params[:name], user_id: @current_user.id )
byebug
    # create investigator_lists with this @list.id
    @investigators = Investigator.where(CITY: "New York").first(10)
    # @investigators = @current_user.lists.second.investigators

    @investigators.each do |investigator|
      # make one listitem each cycle
      InvestigatorsList.create(list_id: @list.id, investigator_id: investigator.id)
    end

    redirect_to @list,  notice: "#{@list.name} was successfully created."
  end 


  # PATCH/PUT /lists/1
  # PATCH/PUT /lists/1.json
  def update
     List.find(name: @list.name)
      @list.add_investigator

    # respond_to do |format|
    #   if @list.update(list_params)
    #     format.html { redirect_to @list, notice: 'List was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @list }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @list.errors, status: :unprocessable_entity }
      # end
    # end
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
      params.require(:list).permit(:name, :user_id)
    end
end