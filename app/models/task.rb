class Task < ApplicationRecord
  belongs_to :project, optional: true
  belongs_to :directory, optional: true
  belongs_to :goal, optional: true
end
