class Donor < ActiveRecord::Base
  attr_accessible :bio, :city, :email, :email_confirmation, :first_name, :image, :last_name, 
  				  :limited_address, :password, :password_confirmation, :state, :street_address, :zip

  validates_confirmation_of :password
  validates_confirmation_of :email
  validates_presence_of :password
  validates_presence_of :email
  validates_uniqueness_of :email

  has_many :donations
  has_many :items
  has_many :events
  
  def encrypt_password
  	if password.present?
  		self.password.salt = BCrypt::Engine.generate_salt
  		self.password.hash = BCrypt::Engine.hash_secret(password, password_salt)
  	end
  end
end
