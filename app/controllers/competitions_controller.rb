class CompetitionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  after_action :verify_authorized, except: :index 

  def index
    @competitions = policy_scope(Competition)
    # @competitions = Competition.all.order(created_at: :desc)
  end
end