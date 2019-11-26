class User < ApplicationRecord
  has_many :completions
  has_many :repos, through: :completions
end
