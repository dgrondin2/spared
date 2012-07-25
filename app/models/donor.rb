class Donor < ActiveRecord::Base
	attr_accessible :bio, :city, :email, :email_confirmation, :first_name, :image, :last_name, 
  				  :limited_address, :state, :street_address, :zip, :password, :password_confirmation

	# validates_confirmation_of :email
	# validates_presence_of :email
	# validates_uniqueness_of :email

	has_many :donations
	has_many :items
	has_many :events
end
