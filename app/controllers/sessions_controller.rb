class SessionsController < ApplicationController
  def donor_login
    if logged_in?
      redirect_to donor_overview_url if current_user.role == 'donor'
      redirect_to org_overview_url if current_user.role == 'organization'
    else
      render "sessions/new", layout: "donor-dash"
    end
  end

  def org_login
    if logged_in?
      redirect_to org_overview_url if current_user.role == 'organization'
      redirect_to donor_overview_url if current_user.role == 'donor'
    else
      render "org-login", layout: "org-dash"
    end
  end

  def create
    user = User.find_by_email(params[:email])

    if wrong_login_form?(user, params[:donor_or_org])
      flash[:error] = "Email or password is invalid."
      redirect_to :back
    elsif user && user.authenticate(params[:password])
      log_in_user(user.id)
      if user.role == "donor"
        redirect_to donor_overview_url, notice: "Logged in!"
      elsif user.role == "organization"
        redirect_to org_overview_url, notice: "Logged in!"
      end
    else
      flash[:error] = "Email or password is invalid"
      redirect_to :back
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end

  def wrong_login_form?(user, donor_or_org)
    if donor_or_org == 'donor' && user.is_organization?
      return true
    elsif donor_or_org == 'org' && user.is_donor?
      return true
    end
    false
  end
end
