class Directory < ApplicationRecord
  has_many :users
  has_many :goals
  has_many :tasks
end
