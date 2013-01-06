class ItemOffer < ActiveRecord::Base
	attr_accessible :animal_type, :category, :city, :condition, :description, :estimated_value, 
					        :expiration_date, :image, :name, :state, :zip

	validates :name, presence: true

  #paperclip
  has_attached_file :image,
                    styles: { thumb: "50x50#", detail: "100x100#" },
                    storage: :s3,
                    s3_credentials: "#{Rails.root}/config/s3.yml",
                    path: "/:style/:id/:filename"
	
	belongs_to :donor
end
