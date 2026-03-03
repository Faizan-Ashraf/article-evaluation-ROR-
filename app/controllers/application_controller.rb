class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def admin?
    current_user&.admin?
  end

  def competitor?
    current_user&.competitor?
  end

  def require_admin
    redirect_to root_path, alert: "You are not authorized to access this page." unless admin?
  end

  def require_competitor
    redirect_to root_path, alert: "You are not authorized to access this page." unless competitor?
  end
end