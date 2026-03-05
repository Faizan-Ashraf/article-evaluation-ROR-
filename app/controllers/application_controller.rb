class ApplicationController < ActionController::Base
  include Pundit::Authorization
  before_action :authenticate_user!

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def admin?
    current_user&.admin?
  end

  def competitor?
    current_user&.competitor?
  end

  private

  def require_admin
    unless current_user&.admin?
      flash[:alert] = "You are not authorized to access this section."
      redirect_to root_path
    end
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_back(fallback_location: root_path)
  end
end