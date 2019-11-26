class ConditionsController < ApplicationController

	def index
		@conditions = Condition.all
	end
	
	def show
		find_condition
	end

	# def new
	# 	@condition = Condition.new
	# end

	# def create
	# 	@condition = Condition.create(condition_params)
	# 	redirect_to @condition
	# end

	# def edit
	# 	find_condition
	# end

	# def update
	# 	find_condition
	# 	@condition.update(condition_params)
	# 	redirect_to @condition
	# end

	# def destroy
	# 	find_condition
	# 	@condition.destroy
	# 	redirect_to conditions_path
	# end

	private

	def find_condition
		@condition = Condition.find(params[:id])
	end

	# def condition_params
	# 	params.require(:condition).permit(:CONDITION)
	# end
end
