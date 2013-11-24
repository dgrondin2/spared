class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :email, :password, :password_confirmation

  belongs_to :donor
  belongs_to :organization

  def is_donor?
    return true if self.donor_id
    false
  end

  def is_organization?
    return true if self.organization_id
    false
  end
end
