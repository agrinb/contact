class Mycontact < ActiveRecord::Base
	belongs_to :user
	has_many :notes
	has_many :meetings
	has_many :comments
end
