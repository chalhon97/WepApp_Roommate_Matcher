class User < ActiveRecord::Base
	has_many :listings
end

class Listing < ActiveRecord::Base
	belongs_to :user
end

