class Project < ApplicationRecord
  has_many :teams_project
  has_many :tasks
end
