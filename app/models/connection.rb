class Connection < ActiveRecord::Base
	#define your connections to your models
	belongs_to :shoe
	belongs_to :user
end
