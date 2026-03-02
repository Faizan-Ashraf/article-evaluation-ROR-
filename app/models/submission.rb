class Submission < ApplicationRecord
  belongs_to :competitor
  belongs_to :competition
end
