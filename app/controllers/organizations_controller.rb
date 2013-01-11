class OrganizationsController < ApplicationController

  before_filter :authorize_org, except: [:new, :create]

  def index
    @organizations = Organization.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @organizations }
    end
  end

  def show
    @organization = Organization.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @organization }
    end
  end

  def new
    @organization = Organization.new
    @organization.user = User.new

    render :layout => 'yield-only'
  end

  def edit
    @user = current_user
    @organization = Organization.find(@user.donor_id)
  end

  def create
    @organization = Organization.new(params[:organization])
    @organization.user.role = "organization"

    respond_to do |format|
      if @organization.save
        session[:user_id] = @organization.user.id
        format.html { redirect_to action: "overview", :notice => 'Registration successful.' }
        format.json { render :json => @organization, :status => :created, :location => @organization }
      else
        format.html { redirect_to :action => "new", :notice => 'Registration failed.' }
        format.json { render :json => @organization.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @user = current_user
    @organization = Organization.find(@user.organization_id)

    respond_to do |format|
      if @donor.update_attributes(params[:donor])
        format.html { redirect_to donor_overview_path, :notice => 'Profile successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @donor.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @organization = Organization.find(params[:id])
    @organization.destroy

    respond_to do |format|
      format.html { redirect_to organizations_url }
      format.json { head :no_content }
    end
  end

  def overview
    @user = current_user
    @organization = Organization.find(@user.organization_id)

    respond_to do |format|
      format.html { render :action => 'overview', :layout => 'org-dash' }
      format.json { }
    end
  end
end
