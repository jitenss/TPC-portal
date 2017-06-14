class CompanyBranch < ActiveRecord::Base
  belongs_to :company
  validates :branch, :presence=>true, :inclusion_of=>{in: %w(CSE ECE CCE MME ME)}
end
