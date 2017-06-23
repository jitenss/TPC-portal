class CompanyDrive < ActiveRecord::Base
belongs_to :company

  validates :start_date, :presence=>true
  validates :no_placed_students, :presence=>true,:numericality=>{:only_integer=>true}

  scope :sorted, lambda { order("company_drives.start_date ASC") }
end
