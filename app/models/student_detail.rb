class StudentDetail < ActiveRecord::Base
	has_many :student_registers

	EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

	validates :s_name, :presence=>true
	validates :batch, :presence=>true, :numericality=>(:only_integer) 
	validates :roll_no, :presence=>true, :uniqueness=>true
	validates :branch, :presence=>true,:inclusion=>{in: ("CSE","ECE","CCE","MME","ME")}
	validates :gender, :presence=>true, :inclusion=>{in: ("Male","Female")}
	validates :date_of_birth, :presence=>true
	validates :contact_no_1, :presence=>true, :numericality=>(:only_integer), :length=>{:is=>10}
	validates :contact_no_2, :numericality=>(:only_integer), :length=>{:is=>10}
	validates :email, :presence=>true, :format=>EMAIL_REGEX
	validates :spi_1, :presence=>true, :numericality=>(less_than_or_equal_to: 10.00)
	validates :spi_2, :presence=>true, :numericality=>(less_than_or_equal_to: 10.00)
	validates :spi_3, :presence=>true, :numericality=>(less_than_or_equal_to: 10.00)
	validates :spi_4, :presence=>true, :numericality=>(less_than_or_equal_to: 10.00)
	validates :spi_5, :presence=>true, :numericality=>(less_than_or_equal_to: 10.00)
	validates :spi_6, :presence=>true, :numericality=>(less_than_or_equal_to: 10.00)
	validates :spi_7, :numericality=>(less_than_or_equal_to: 10.00)
	validates :cpi_6, :presence=>true, :numericality=>(less_than_or_equal_to: 10.00)
	validates :cpi_7, :numericality=>(less_than_or_equal_to: 10.00)
	validates :percent_10, :presence=>true, :numericality=>(less_than: 100.00)
	validates :percent_12, :presence=>true, :numericality=>(less_than: 100.00)

end
