class CompanyDrivesController < ApplicationController
  
  def index
    @c=CompanyDrive.sorted
  end

  def new
    @c=CompanyDrive.new
  end

  def show
  end

  def delete
  end
end
