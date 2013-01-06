class Donor < ActiveRecord::Base

	attr_accessible :bio, :city, :first_name, :image, :last_name,
            :limited_address, :state, :street_address, :zip, :user_id, :user_attributes, :avatar

  # validates_confirmation_of :email
  # validates_presence_of :email
  # validates_uniqueness_of :email

  has_many :donations
  has_many :items
  has_many :events
  has_one :user

  accepts_nested_attributes_for :user

  #paperclip
  has_attached_file :avatar,
                    :styles => { :thumb=> "75x75#" },
                    :storage => :s3,
                    :s3_credentials => "#{Rails.root}/config/s3.yml",
                    :path => "/:style/:id/:filename"
end
