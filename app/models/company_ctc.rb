class CompanyCtc < ActiveRecord::Base
  belongs_to :company
  validates :position, :presence=>true
  validates :ctc, :presence=>true,:numericality=>{:greater_than_or_equal_to :300000}

end
