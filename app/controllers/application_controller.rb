class ApplicationController < ActionController::Base
  protect_from_forgery

  def logged_in?
    current_user.present?
  end
  helper_method :logged_in?

  private

  def current_user
    # find() returns nil if user not found
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize_donor
    redirect_to donor_login_url, alert: "You must log in first!" if current_user.nil?
  end

  def authorize_org
    redirect_to org_login_url, alert: "You must log in first!" if current_user.nil?
  end

  def cookie_domain
    Rails.env.development? ? '.localhost' : '.spared.org'
  end
end
