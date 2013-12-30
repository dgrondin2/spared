class WishlistsController < ApplicationController
  before_filter :authorize_user

  def index
    @user = current_user
    @wishlists = Wishlist.all

    respond_to do |format|
      format.html {
        if @user.role == "organization"
          render :action => 'index', layout: 'org-dash'
        else
          render :action => 'index', layout: 'donor-dash'
        end
      }
      format.json { render :json => @wishlists }
    end
  end

  def new
    @user = current_user
    @wishlist = Wishlist.new

    respond_to do |format|
      format.html {
        render :action => 'new', :layout => 'org-dash'
      }
      format.json { render :json => @wishlist }
    end
  end

  def create
    org = Organization.find(current_user.organization_id)
    @wishlist = Wishlist.new(params[:wishlist])
    @wishlist.organization_id = org.id

    respond_to do |format|
      if @wishlist.save
        format.html { redirect_to :back, :notice => 'Item-offer was successfully posted.' }
        format.json { render :json => @wishlist, :status => :created, :location => @wishlist }
      else
        format.html { render :action => "new", :layout => 'org-dash' }
        format.json { render :json => @wishlist.errors, :status => :unprocessable_entity }
      end
    end
  end

  def show
    @wishlist = Wishlist.find(params[:id])
    @user = current_user
    @organization = Organization.find(@user.organization_id)
    @wishlist_items = @wishlist.wishlist_items if @wishlist.present?

    respond_to do |format|
      format.html {
        render action: 'show', layout: 'yield-only'
      }
      format.json { render :json => @wishlist_items }
    end
  end

  def my_wishlists
    @user = current_user
    @wishlists = Wishlist.all

    respond_to do |format|
      format.html { render action: 'my-wishlists', layout: 'org-dash' }
    end
  end
end
