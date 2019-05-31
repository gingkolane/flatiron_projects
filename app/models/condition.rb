class Condition < ApplicationRecord
  has_and_belongs_to_many :studies

  def find_studies_id
    self.studies.ids
  end


  def find_study
    self.find_studies_id.map do |id|
      Study.find(id)
    end
  end

  def intervention_array
    self.find_study.map do |study|
      study.interventions
    end
  end

  def intervention
    self.intervention_array.map do |interventions|
      interventions.map do |intervention|
        intervention.INTERVENTION_NAME
      end
    end
  end


end
