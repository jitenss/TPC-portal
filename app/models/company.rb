class Company < ActiveRecord::Base
	has_many :student_registers
	has_many :student_placeds
end
