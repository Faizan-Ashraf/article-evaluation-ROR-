class Submission < ApplicationRecord
  belongs_to :competitor, class_name: 'User'
  belongs_to :competition

  enum :status, { pending: 'Pending', evaluated: 'Evaluated' }

  def self.rank(competition_id)
    submissions = where(competition_id: competition_id, status: :evaluated).order(score: :desc)

    current_rank = 0
    last_score = nil

    submissions.find_each do |sub|
      if sub.score != last_score
        current_rank += 1
        last_score = sub.score
      end


      sub.update_column(:ranking, current_rank)
    end
  end
end