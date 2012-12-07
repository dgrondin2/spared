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
end
