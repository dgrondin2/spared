class Donation < ActiveRecord::Base
  attr_accessible :amount, :date_donated
  
  belongs_to :donor
  belongs_to :organization
end
