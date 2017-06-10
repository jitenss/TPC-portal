class StudentDetail < ActiveRecord::Base
	has_many :student_registers

	EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

	validates :s_name, :presence=>true
	validates :batch, :presence=>true, :numericality=>true 
	validates :roll_no, :presence=>true, :uniqueness=>true
	validates :branch, :presence=>true
	validates :gender, :presence=>true
	validates :date_of_birth, :presence=>true
	validates :contact_no_1, :presence=>true, :numericality=>true
	validates :contact_no_1, :numericality=>true
	validates :email, :presence=>true, :format=>EMAIL_REGEX
	validates :spi_1, :presence=>true, :numericality=>true
	validates :spi_2, :presence=>true, :numericality=>true
	validates :spi_3, :presence=>true, :numericality=>true
	validates :spi_4, :presence=>true, :numericality=>true
	validates :spi_5, :presence=>true, :numericality=>true
	validates :spi_6, :presence=>true, :numericality=>true
	validates :spi_7, :numericality=>true
	validates :cpi_6, :presence=>true, :numericality=>true
	validates :cpi_7, :numericality=>true
	validates :10_percent, :presence=>true, :numericality=>true
	validates :12_percent, :presence=>true, :numericality=>true

end
