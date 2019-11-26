class InterventionsController < ApplicationController

	def index
		@interventions = Intervention.all
	end
	
	def show
		find_intervention
	end

	# def new
	# 	@intervention = Intervention.new
	# end

	# def create
	# 	@intervention = Intervention.create(intervention_params)
	# 	redirect_to @intervention
	# end

	# def edit
	# 	find_intervention
	# end

	# def update
	# 	find_intervention
	# 	@intervention.update(intervention_params)
	# 	redirect_to @intervention
	# end

	# def destroy
	# 	find_intervention
	# 	@intervention.destroy
	# 	redirect_to interventions_path
	# end

	private

	def find_intervention
		@intervention = Intervention.find(params[:id])
	end

	# def intervention_params
	# 	params.require(:intervention).permit(:)
	# end

end
