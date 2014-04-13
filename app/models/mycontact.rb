class Mycontact < ActiveRecord::Base
	belongs_to :user
	has_many :notes
	has_many :meetings
	has_many :comments
	accepts_nested_attributes_for :notes, :meetings, :comments
end
