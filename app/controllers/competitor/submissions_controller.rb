class Competitor::SubmissionsController < ApplicationController
  before_action :require_competitor
  before_action :set_competition, only: [:new, :create]

  def index
    @submissions = current_user.submissions.includes(:competition).order(created_at: :desc)
  end

  def new
    @submission = Submission.new
  end

  def create
    @submission = current_user.submissions.build(submission_params)
    @submission.competition = @competition
    @submission.created_at = Time.current
    if @submission.save
      redirect_to competitor_my_results_path, notice: 'Article submitted successfully.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_competition
    @competition = Competition.find(params[:competition_id])
  end

  def submission_params
    params.require(:submission).permit(:content)
  end
end