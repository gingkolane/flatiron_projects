# require_relative 'study.rb'
class Condition < ApplicationRecord

  # has_many :studies
  # belongs_to :user

  def find_studies
    Study.where(NCT_ID: self.NCT_ID)
  end

  def find_investigators
    Investigator.where(NCT_ID: self.NCT_ID)
  end

  def find_facilities
    Facility.where(NCT_ID: self.NCT_ID)
  end

  def find_facilities_by_city(city)
    find_facilities.select {|f| f.CITY == city}
  end

  def best_doctors
    rating_hash = {}
    find_investigators.each do |investigator| 
      rating_hash[investigator.NAME_DEGREE] = investigator.rated_by_mcw
    end
    rating_hash.sort_by {|k,v| v}.reverse
    rating_hash
  end

  def top_10_doctors
    best_doctors_by_condition[0...10]
  end

  def best_doctors_by_city(city)
    best_doctors.select {|f| f.CITY == city}
  end
end