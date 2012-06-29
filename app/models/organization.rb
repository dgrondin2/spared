class Organization < ActiveRecord::Base
  attr_accessible :city, :email, :email_confirmation, :image, :limited_address, :organization_description, 
  				  :organization_name, :password, :password_confirmation, :representative_name, :state, 
  				  :street_address, :website, :zip
  				  
  validates_confirmation_of :password
  validates_confirmation_of :email
  validates_presence_of :password
  validates_presence_of :email
  validates_uniqueness_of :email

  has_many :donations
  has_many :wishlist_items
  has_many :events
end
