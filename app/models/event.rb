class Event < ActiveRecord::Base
  attr_accessible :city, :description, :image, :name, :number_of_volunteers_needed, :state, :start_time

  has_calendar

  belongs_to :organization
  has_many :donors
end
