class Event < ActiveRecord::Base
  attr_accessible :city, :description, :image, :name, :number_of_volunteers_needed, :state, :when

  belongs_to :organization
  has_many :donors
end
