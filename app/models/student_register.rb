class StudentRegister < ActiveRecord::Base
	belongs_to :company
	belongs_to :student, :class_name=>'StudentDetail',:foreign_key=>'roll_no'
	has_many :studentPlaceds
end
