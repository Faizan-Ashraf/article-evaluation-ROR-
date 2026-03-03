class CompetitionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @competitions = Competition.all.order(created_at: :desc)
  end
end