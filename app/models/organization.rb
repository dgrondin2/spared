class Organization < ActiveRecord::Base

    # Setup accessible (or protected) attributes for your model
	attr_accessible :city, :avatar, :limited_address, :organization_description, :user_attributes, :organization_name, :representative_name, :state, :street_address, :website, :zip, :bio
  				  
	# validates_confirmation_of :email
	# validates_presence_of :email
	# validates_uniqueness_of :email

	has_many :donations
	has_many :wishlists
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
