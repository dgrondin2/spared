class ItemOffersController < ApplicationController

  before_filter :authorize_donor

  def overview
    respond_to do |format|
      format.html { render :action => 'donor-overview', :layout => 'donor-dash' }
    end
  end

  def index
    @user = current_user
    @item_offers = ItemOffer.all

      respond_to do |format|
        format.html {
          if @user.role == "donor"
            render :action => 'donor-index', layout: 'donor-dash'
          elsif @user.role == "organization"
            render :action => 'org-index', layout: 'org-dash'
          end
        }
        format.json { render :json => @item_offers }
      end
  end

  def show
    @item_offer = ItemOffer.find(params[:id])
    @user = current_user

    respond_to do |format|
      format.html {
        if @user.role == "donor"
          render action: 'donor-show', layout: 'yield-only'
        elsif @user.role == "organization"
          render action: 'org-show', layout: 'yield-only'
        end
      } # show.html.erb
      format.json { render :json => @item_offer }
    end
  end

  def new
    @item_offer = ItemOffer.new

    respond_to do |format|
      format.html { # if user role is donor:
                    render :action => 'donor-new', :layout => 'donor-dash' }
      format.json { render :json => @item_offer }
    end
  end

  # Not sure but I don't think this is in the design (but perhaps should be?)
  def edit
    @item = ItemOffer.find(params[:id])
  end

  def create
    donor = Donor.find(current_user.donor_id)
    @item_offer = ItemOffer.new(params[:item_offer])
    @item_offer.donor_id = donor.id

    respond_to do |format|
      if @item_offer.save
        format.html { redirect_to :back, :notice => 'Item-offer was successfully posted.' }
        format.json { render :json => @item_offer, :status => :created, :location => @item_offer }
      else
        format.html { render :action => "donor-new", :layout => 'donor-dash' }
        format.json { render :json => @item_offer.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @item_offer = ItemOffer.find(params[:id])

    respond_to do |format|
      if @item_offer.update_attributes(params[:item_offer])
        format.html { redirect_to @item_offer, :notice => 'Item-offer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @item_offer.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @item_offer = ItemOffer.find(params[:id])
    @item_offer.destroy

    respond_to do |format|
      format.html { redirect_to item_offers_url }
      format.json { head :no_content }
    end
  end
end
