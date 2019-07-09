class Completion < ApplicationRecord
  belongs_to :repo
  belongs_to :user
end
