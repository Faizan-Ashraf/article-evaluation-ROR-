class Admin::CompetitionsController < ApplicationController
  before_action :require_admin
  before_action :set_competition, only: [:submissions, :evaluate]

  def new
    @competition = Competition.new
  end

  def create
    @competition = Competition.new(competition_params)
    @competition.created_by = current_user
    if @competition.save
      redirect_to root_path, notice: 'Competition created successfully.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def submissions
    @competition = Competition.find(params[:id])
    # render submissions view
  end

  def evaluate

    @competition.submissions.each do |sub|
      sub.update(
        score: rand(1..100),
        feedback: "Auto-generated feedback",
        evaluated_at: Time.current,
        status: :evaluated
      )
    end

    Submission.rank(@competition.id)
    redirect_to submissions_admin_competition_path(@competition), notice: 'AI Evaluation completed.'
  end

  private

  def set_competition
    @competition = Competition.find(params[:id])
  end

  def competition_params
    params.require(:competition).permit(:title, :description, :evaluation_criteria, :is_active)
  end
end