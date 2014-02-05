class Shoe < ActiveRecord::Base
	has_many :connections
	has_many :users, through: :connections
end
