class SessionsController < ApplicationController
  def donor_login
    if current_user
      redirect_to donors_overview_url
    else
      render "donor-login", layout: "donor-dash"
    end
  end

  def org_login
    if current_user
      redirect_to org_overview_url
    else
      render "org-login", layout: "org-dash"
    end

  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to donor_overview_url, notice: "Logged in!"
    else
      flash.now.alert = "Email or password is invalid"
      render "donor-login"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end
