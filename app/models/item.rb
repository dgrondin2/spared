class Item < ActiveRecord::Base
	attr_accessible :animal_type, :category, :city, :condition, :description, :estimated_value, 
					:expiration_date, :image, :name, :state, :zip

	validates :name, :presence => true
	
	belongs_to :donor
	belongs_to :organization
end
