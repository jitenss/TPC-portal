class Company < ActiveRecord::Base

	max_cgpa=10.00
	has_many :student_registers
	has_many :student_placeds
	has_many :company_drives
	has_many :company_branches
	has_many :company_ctcs

	validates :c_name, :presence=>true
	validates :cpiCriteria, :presence=>true,:numericality=> {:less_than_or_equal_to => 10.00}
	validates :category, :presence=>true,:inclusion => {:in => %w(Dream Regular Core)}
	validates :backlogs, :presence=>true,:numericality=>true

	scope :sorted, lambda { order("companies.c_name ASC") }
end
