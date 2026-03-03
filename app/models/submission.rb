class Submission < ApplicationRecord
  belongs_to :competitor, class_name: 'User'
  belongs_to :competition

  enum :status, { pending: 'Pending', evaluated: 'Evaluated' }
end