class Donor < ActiveRecord::Base

    # Setup accessible (or protected) attributes for your model
	  attr_accessible :bio, :city, :first_name, :image, :last_name,
  				          :limited_address, :state, :street_address, :zip

    # validates_confirmation_of :email
    # validates_presence_of :email
    # validates_uniqueness_of :email

    has_many :donations
    has_many :items
    has_many :events
end
