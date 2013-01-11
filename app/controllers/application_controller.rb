class ApplicationController < ActionController::Base
  protect_from_forgery

  layout :layout_by_resource

  protected

  #TODO: This is a total pain but do this for every ctrl'er/action
  def layout_by_resource
    if controller_name == "sessions" || controller_name == "donors"
      "donor-dash"
    elsif controller_name == "registrations" && action_name == "new"
      "yield-only"
    else
      "application"
    end
  end


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
