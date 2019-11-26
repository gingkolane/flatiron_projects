class Study < ApplicationRecord

	has_and_belongs_to_many :conditions
	has_and_belongs_to_many :interventions
	has_and_belongs_to_many :investigators
	has_and_belongs_to_many :sponsors

	belongs_to :sponsor
	belongs_to :investigator

	def find_investigators
		self.investigators
	end

	def investigators_name
		self.find_investigators.map do |investigators|
			investigators.NAME_DEGREE
		end
	end

	def investigator
		self.investigators_name.join(", ")
	end



end
