class DonorsController < ApplicationController

  before_filter :authorize_donor, except: [:new, :create]

  # View donor profile
  def show
    @donor = Donor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @donor }
    end
  end

  def new

    @donor = Donor.new
    @donor.user = User.new

    render layout: 'yield-only'
  end

  # Edit profile
  def edit
    @user = current_user
    @donor = Donor.find(@user.donor_id)

    render layout: "donor-dash"
  end

  # Donor user registration -- POST
  def create

    @donor = Donor.new(params[:donor])
    @donor.user.role = 'donor'
    @donor.user.donor_id = @donor.id

    respond_to do |format|
      if @donor.save
        log_in_user(@donor.user.id)
        format.html { redirect_to action: 'overview' }
        format.json { render :json => @donor, :status => :created }
      else
        flash[:error] = 'Registration failed. Please try again.'
        Rails.logger.info "Registration failed: #{@donor.errors}"

        #TODO: I don't think we want to simply redirect to donors#new since its view is a modal
        format.html { redirect_to :action => 'new' }
        format.json { render :json => @donor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # Edit profile -- POST
  def update
    @user = current_user
    @donor = Donor.find(@user.donor_id)

    respond_to do |format|
      if @donor.update_attributes(params[:donor])
        format.html { redirect_to donor_overview_path, :notice => 'Profile successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => 'edit' }
        format.json { render :json => @donor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # "MY DASHBOARD" actions

  def overview
    @user = current_user
    @donor = Donor.find(@user.donor_id)

    #TODO: Combine queries into one model method
    @item_offers = ItemOffer.where("donor_id = ?", @user.donor_id)
    @donations = Donation.where("donor_id = ?", @user.donor_id)
    @total_donated = Donation.sum(:amount, conditions: {donor_id: @user.donor_id})
    @events = Event.where("donor_id = ?", @user.donor_id)

    respond_to do |format|
      format.html { render :action => 'overview', :layout => 'donor-dash' }
      format.json { }
    end
  end

  def my_item_offers
    @user = current_user
    @item_offers = ItemOffer.where("donor_id = ?", @user.donor_id)

    respond_to do |format|
      format.html { render :action => 'my-item-offers', :layout => 'donor-dash' }
      format.json { }
    end
  end

  def my_donations
    @user = current_user
    @donations = Donation.where("donor_id = ?", @user.donor_id)
    @total_amount = Donation.sum(:amount, conditions: {donor_id: @user.donor_id})

    respond_to do |format|
      format.html { render :action => 'my-donations', :layout => 'donor-dash' }
      format.json { }
    end
  end

  def my_events
    @user = current_user
    @events = Event.where("donor_id = ?", @user.donor_id)

    respond_to do |format|
      format.html { render :action => 'my-events', :layout => 'donor-dash' }
      format.json { }
    end
  end

end
