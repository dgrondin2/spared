class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize_donor
    redirect_to donor_login_url, alert: "You must log in first!" if current_user.nil?
  end

  def authorize_org
    redirect_to org_login_url, alert: "You must log in first!" if current_user.nil?
  end
end
