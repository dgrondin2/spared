class DonorsController < ApplicationController

  before_filter :authorize, except: [:new, :create]

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

    render layout: 'yieldonly'
  end

  def login
    render :layout => 'donordash'
  end

  # Edit profile
  def edit
    @donor = Donor.find(params[:id])
  end

  # Donor user registration -- POST
  def create
    @donor = Donor.new(params[:donor])
    @user = User.new(params[:user])

    @donor.user_id = @user.id
    puts @user.id

    respond_to do |format|
      if @donor.save and @user.save
        puts "Registered! Now logging in..."
        session[:user_id] = @user.id
        format.html { redirect_to @donor, :notice => 'Registration successful.' }
        format.json { render :json => @donor, :status => :created, :location => @donor }
      else
        format.html { redirect_to :action => "new", :notice => 'Registration failed.' }
        format.json { render :json => @donor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # Edit profile -- POST
  def update
    @donor = Donor.find(params[:id])

    respond_to do |format|
      if @donor.update_attributes(params[:donor])
        format.html { redirect_to @donor, :notice => 'Profile successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @donor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # I don't think this will be used
  def destroy
    @donor = Donor.find(params[:id])
    @donor.destroy

    respond_to do |format|
      format.html { redirect_to donors_url }
      format.json { head :no_content }
    end
  end


  # "MY DASHBOARD" actions:
  # TODO: json

  def overview


    respond_to do |format|
      format.html { render :action => 'overview', :layout => 'donordash' }
      format.json { }
    end
  end

  def my_item_offers


    respond_to do |format|
      format.html { render :action => 'my-item-offers', :layout => 'donordash' }
      format.json { }
    end
  end

  def my_donations

    respond_to do |format|
      format.html { render :action => 'my-donations', :layout => 'donordash' }
      format.json { }
    end
  end

  def my_events
    @events = Event.all

    respond_to do |format|
      format.html { render :action => 'my-events', :layout => 'donordash' }
      format.json { }
    end
  end

end
