class StudyCondition < ApplicationRecord
	belongs_to :condition
	belongs_to :study
end
