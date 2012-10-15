class ItemOffersController < ApplicationController

  def overview
    respond_to do |format|
      format.html { #if user role is donor:
                    render :action => 'donor-overview', :layout => 'donordash'}
      # format.json { }
    end
  end

  def index
    @item_offers = ItemOffer.all
    respond_to do |format|
      format.html { # if user role is donor:
                    render :action => 'donor-index', :layout => 'donordash' }
      format.json { render :json => @item_offers }
    end
  end

  def show
    @item_offer = ItemOffer.find(params[:id])

    respond_to do |format|
      format.html { render :action => 'donor-show', :layout => 'yieldonly' } # show.html.erb
      format.json { render :json => @item_offer }
    end
  end

  def new
    @item_offer = ItemOffer.new

    respond_to do |format|
      format.html { # if user role is donor:
                    render :action => 'donor-new', :layout => 'donordash' }
      format.json { render :json => @item_offer }
    end
  end

  # Not sure but I don't think this is in the design (but perhaps should be?)
  def edit
    @item = ItemOffer.find(params[:id])
  end

  def create
    @item_offer = ItemOffer.new(params[:item_offer])

    respond_to do |format|
      if @item_offer.save
        format.html { redirect_to :back, :notice => 'Item-offer was successfully posted.' }
        format.json { render :json => @item_offer, :status => :created, :location => @item_offer }
      else
        format.html { render :action => "donor-new", :layout => 'donordash' }
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
