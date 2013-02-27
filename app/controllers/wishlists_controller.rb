class WishlistsController < ApplicationController
  def index
    @user = current_user
    @wishlists = Wishlist.all

    respond_to do |format|
      format.html {
        if @user.role == "donor"
          render :action => 'donor-index', layout: 'donor-dash'
        elsif @user.role == "organization"
          render :action => 'org-index', layout: 'org-dash'
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
        render :action => 'org-new', :layout => 'org-dash'
      }
      format.json { render :json => @wishlist }
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
