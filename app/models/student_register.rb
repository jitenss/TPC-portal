class StudentRegister < ActiveRecord::Base
	belongs_to :company
	belongs_to :student, :class_name=>'StudentDetail'
	has_many :studentPlaceds
end
