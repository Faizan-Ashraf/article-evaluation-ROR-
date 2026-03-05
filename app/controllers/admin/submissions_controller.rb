class Admin::SubmissionsController < ApplicationController
  before_action :require_admin
  before_action :set_submission, only: [:edit, :update]

  def edit
    authorize @submission
  end

  def update
    authorize @submission
    if @submission.update(manual_evaluation_params)
      Submission.rank(@submission.competition_id)
      redirect_to submissions_admin_competition_path(@submission.competition), 
                  notice: 'Submission evaluated successfully.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_submission
    @submission = Submission.find(params[:id])
  end

  def manual_evaluation_params
    params.require(:submission).permit(:score, :feedback).merge(
      evaluated_at: Time.current,
      status: :evaluated
    )
  end
end