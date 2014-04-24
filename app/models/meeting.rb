class Meeting < ActiveRecord::Base
	belongs_to :mycontact
	has_many :userfiles
  accepts_nested_attributes_for :userfiles
end
