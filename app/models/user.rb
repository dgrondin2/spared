class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :email, :password, :password_confirmation

  belongs_to :donor
  belongs_to :organization
end
