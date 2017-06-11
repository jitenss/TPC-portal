class CompanyDrive < ActiveRecord::Base
belongs_to :company

  validates :start_date, :presence=>true
  validates :no_placed_students, :presence=>true,:numericality=>(:only_integer)
end
