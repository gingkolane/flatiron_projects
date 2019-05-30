class InvestigatorsController < ApplicationController
	
	def index
		@investigators = Investigator.all
	end
	
	def show
		find_investigator
	end

	# def new
	# 	@investigator = Investigator.new
	# end

	# def create
	# 	@investigator = Investigator.create(investigator_params)
	# 	redirect_to @investigator
	# end

	# def edit
	# 	find_investigator
	# end

	# def update
	# 	find_investigator
	# 	@investigator.update(investigator_params)
	# 	redirect_to @investigator
	# end

	# def destroy
	# 	find_investigator
	# 	@investigator.destroy
	# 	redirect_to investigators_path
	# end

	private

	def find_investigator
		@investigator = Investigator.find(params[:id])
	end

	# def investigator_params

	# end

end
