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
    Rails.env.development? ? 'localhost' : 'spared.org'
  end

  def log_in_user(user_id)
    # assumes log in is successful
    session[:user_id] = user_id
    cookie_val = current_user.role == 'organization' ? 'org' : 'donor'
    cookies[:is_member] = {
        value: cookie_val,
        domain: cookie_domain,
        path: '/',
        expires: 1.year.from_now
    }
  end
end
