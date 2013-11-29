class DonationsController < ApplicationController
  before_filter :authorize_user

  # GET /donations
  # GET /donations.json
  def index
    @donations = Donation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @donations }
    end
  end

  # GET /donations/1
  # GET /donations/1.json
  def show
    @donation = Donation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @donation }
    end
  end

  # GET /donations/new
  # GET /donations/new.json
  def new
    @donation = Donation.new

    respond_to do |format|
      format.html { # if user role is donor:
                    render :action => 'donor-new', :layout => 'donor-dash' }
      format.json { render :json => @donation }
    end
  end

  # GET /donations/1/edit
  def edit
    @donation = Donation.find(params[:id])
  end

  # POST /donations
  # POST /donations.json
  def create
    @donation = Donation.new(params[:donation])

    respond_to do |format|
      if @donation.save
        format.html { redirect_to @donation, :notice => 'Donation was successfully created.' }
        format.json { render :json => @donation, :status => :created, :location => @donation }
      else
        format.html { render :action => "donor-new", :layout => 'donor-dash' }
        format.json { render :json => @donation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /donations/1
  # PUT /donations/1.json
  def update
    @donation = Donation.find(params[:id])

    respond_to do |format|
      if @donation.update_attributes(params[:donation])
        format.html { redirect_to @donation, :notice => 'Donation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @donation.errors, :status => :unprocessable_entity }
      end
    end
  end

  def distribute
    @user = current_user
    @wishlists = Wishlist.all

    respond_to do |format|
      format.html { render action: 'org-distribute', layout: 'org-dash' }
    end
  end
end
