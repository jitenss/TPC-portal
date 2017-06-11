class CompanyBranch < ActiveRecord::Base
  belongs_to :company
  validates :branch, :presence=>true, inclusion: { in: ("CSE","ECE","CCE","MME","ME"),
end
