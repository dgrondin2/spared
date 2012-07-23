class User < ActiveRecord::Base
	acts_as_authentic
	
	# :username is user's email address. :role is either "donor" or "organization".
	# Do I need this?:
    # attr_accessible :username, :password, :role
    
    belongs_to :authenticable, :polymorphic => true
end
