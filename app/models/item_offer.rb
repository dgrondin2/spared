class ItemOffer < ActiveRecord::Base
	attr_accessible :animal_type, :category, :city, :condition, :description, :estimated_value, 
					        :expiration_date, :image, :name, :state, :zip

	validates :name, :presence => true
  has_attached_file :image, :styles => { :thumb => "50x50>" }
	
	belongs_to :donor
	belongs_to :organization
end
