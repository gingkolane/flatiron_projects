class Repo < ApplicationRecord
  has_many :completions
  has_many :users, through: :completions
end
