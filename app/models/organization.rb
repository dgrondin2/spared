class Organization < ActiveRecord::Base

    # Setup accessible (or protected) attributes for your model
	attr_accessible :city, :image, :limited_address, :organization_description,
  				    :organization_name, :representative_name, :state, :street_address, :website, :zip
  				  
	# validates_confirmation_of :email
	# validates_presence_of :email
	# validates_uniqueness_of :email

	has_many :donations
	has_many :wishlist_items
	has_many :events
end
