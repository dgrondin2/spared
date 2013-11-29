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

    render layout: 'yield-only'
  end

  def edit
    @user = current_user
    @organization = Organization.find(@user.organization_id)

    render layout: 'org-dash'
  end

  def create
    @organization = Organization.new(params[:organization])
    @organization.user.role = "organization"
    @organization.user.organization_id = @organization.id

    respond_to do |format|
      if @organization.save
        log_in_user(@organization.user.id)
        format.html { redirect_to action: "overview", :notice => 'Registration successful.' }
        format.json { render :json => @organization, :status => :created }
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
      if @organization.update_attributes(params[:organization])
        format.html { redirect_to org_overview_path, :notice => 'Profile successfully updated.' }
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

    @wishlists = Wishlist.where("organization_id = ?", @user.organization_id)
    # @donation_total
    # @num_donors_donated
    # @pending_item_matches

    respond_to do |format|
      format.html { render :action => 'overview', :layout => 'org-dash' }
      format.json { }
    end
  end

  def my_item_matches
    @user = current_user
    @item_matches = ItemMatch.where("organization_id = ?", @user.organization_id)

    respond_to do |format|
      format.html { render :action => 'my-item-matches', :layout => 'org-dash' }
      format.json { }
    end
  end

  def my_donations
    @user = current_user
    @donations = Donation.where("organization_id = ?", @user.organization_id)
    @total_amount = Donation.sum(:amount, conditions: {organization_id: @user.organization_id})

    render action: 'my-donations', layout: 'org-dash'
  end

  def my_events
    @user = current_user
    @events = Event.where("organization_id = ?", @user.organization_id)

    render action: 'my-events', layout: 'org-dash'
  end
end
