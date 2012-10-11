class Donor < ActiveRecord::Base
    # Include default devise modules. Others available are:
    # :token_authenticatable, :confirmable,
    # :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable

    # Setup accessible (or protected) attributes for your model
	  attr_accessible :bio, :city, :email, :email_confirmation, :first_name, :image, :last_name, 
  				          :limited_address, :state, :street_address, :zip, :password, :password_confirmation
  				          :remember_me

    # validates_confirmation_of :email
    # validates_presence_of :email
    # validates_uniqueness_of :email

    has_many :donations
    has_many :items
    has_many :events
end
