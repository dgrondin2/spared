module DonorsHelper
  def resource_name
    :donor
  end
 
  def resource
    @resource ||= Donor.new
  end
 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:donor]
  end
end
