class StudiesController < ApplicationController

	def index
		@studies = Study.all
	end
	
	def show
		find_study
	end

	# def new
	# 	@study = Study.new
	# end

	# def create
	# 	@study = Study.create(study_params)
	# 	redirect_to @study
	# end

	# def edit
	# 	find_study
	# end

	# def update
	# 	find_study
	# 	@study.update(study_params)
	# 	redirect_to @study
	# end

	# def destroy
	# 	find_study
	# 	@study.destroy
	# 	redirect_to studies_path
	# end

	private

	def find_study
		@study = Study.find(params[:id])
	end

	# def study_params

	# end

end
