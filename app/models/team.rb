class Team < ApplicationRecord
  has_many :teams_project
  has_many :users_team
end
