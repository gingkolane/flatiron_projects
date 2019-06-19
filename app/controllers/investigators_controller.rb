class InvestigatorsController < ApplicationController
  before_action :set_investigator, only: [:show, :edit, :update, :destroy]

  # GET /investigators
  # GET /investigators.json


  def index
    @list = @current_user.lists.new
    if params[:search]
      @investigators = Investigator.where("NAME_DEGREE like ?", "%#{params[:search]}%")
      # @investigators = Investigator.where(name: params[:search])
    else
      @investigators = Investigator.all.first(50)
    end
  end

  # GET /investigators/1
  # GET /investigators/1.json
  def show
  end

  # GET /investigators/new
  def new
    @investigator = Investigator.new
  end

  # GET /investigators/1/edit
  def edit
  end

  # POST /investigators
  # POST /investigators.json
  def create
    @investigator = Investigator.new(investigator_params)

    respond_to do |format|
      if @investigator.save
        format.html { redirect_to @investigator, notice: 'Investigator was successfully created.' }
        format.json { render :show, status: :created, location: @investigator }
      else
        format.html { render :new }
        format.json { render json: @investigator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /investigators/1
  # PATCH/PUT /investigators/1.json
  def update
    respond_to do |format|
      if @investigator.update(investigator_params)
        format.html { redirect_to @investigator, notice: 'Investigator was successfully updated.' }
        format.json { render :show, status: :ok, location: @investigator }
      else
        format.html { render :edit }
        format.json { render json: @investigator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /investigators/1
  # DELETE /investigators/1.json
  def destroy
    @investigator.destroy
    respond_to do |format|
      format.html { redirect_to investigators_url, notice: 'Investigator was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_investigator
      @investigator = Investigator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def investigator_params
      params.require(:investigator).permit(:NAME_DEGREE, :ROLE, :FACILITY_NAME, :CITY, :STATE, :ZIP, :COUNTRY)
    end
end
