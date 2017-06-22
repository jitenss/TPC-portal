class TpcMember < ActiveRecord::Base
  username="TPC"
  password="1"
  attr_accessor :username, :password
  scope :sorted, lambda { order("tpc_members.t_name ASC") }
end
