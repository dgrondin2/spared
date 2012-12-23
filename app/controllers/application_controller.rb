class ApplicationController < ActionController::Base
  protect_from_forgery

  layout :layout_by_resource

  protected

  def layout_by_resource
    if controller_name == "sessions" || controller_name == "donors"
      "donordash"
    elsif controller_name == "registrations" && action_name == "new"
      "yieldonly"
    else
      "application"
    end
  end


  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    redirect_to login_url, alert: "Not authorized" if current_user.nil?
  end
end
