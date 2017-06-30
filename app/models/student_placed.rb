class StudentPlaced < ActiveRecord::Base
	belongs_to :company
	belongs_to :student_register, :foreign_key=>'roll_no'

	validates :ctc, :presence=>true, :numericality=>true
	validates :type, :presence=>true
end
