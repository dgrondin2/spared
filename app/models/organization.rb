class Organization < ActiveRecord::Base
    # Include default devise modules. Others available are:
    # :token_authenticatable, :confirmable,
    # :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable

    # Setup accessible (or protected) attributes for your model
	attr_accessible :city, :email, :email_confirmation, :image, :limited_address, :organization_description, 
  				    :organization_name, :representative_name, :state, :street_address, :website, :zip,
  				    :password, :password_confirmation, :remember_me
  				  
	# validates_confirmation_of :email
	# validates_presence_of :email
	# validates_uniqueness_of :email

	has_many :donations
	has_many :wishlist_items
	has_many :events
end
