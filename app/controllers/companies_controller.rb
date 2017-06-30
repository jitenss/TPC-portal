class CompaniesController < ApplicationController

  layout('tpc')
  before_action :authenticate_user!

  def index
    @company=Company.sorted
  end

  def show
    @company=Company.find(params[:id])
  end

  def new
    @company=Company.new
    @company_branches=@company.company_branches.new
  end

  def edit
    @company=Company.find(params[:id])
  end

  def delete
    @company=Company.find(params[:id])
  end

  def show_filter
    @company = Company.where(name()).first
    render("show")
  end

  def edit_filter
    @company = Company.where(name()).first
    render("edit")
  end

  def delete_filter
    @company = Company.where(name()).first
    render("delete")
  end

  def enter_no_show
		@company=Company.new
	end

	def enter_no_edit
    @company=Company.new
	end

	def enter_no_delete
    @company=Company.new
	end


def destroy
  company=Company.find(params[:id]).destroy
  flash[:notice]="Company succeessfully destroyed"
    redirect_to(:action=>'index')
end

def create
  @company = Company.new(company_params())
  # Save the object
  if @company.save
    # If save succeeds, redirect to the index action
    #flash[:notice]="Company succeessfully created"
    redirect_to(:action => 'index')
  else
    # If save fails, redisplay the form so user can fix problems
    render('new')
  end
end

def update
  @company=Company.find(params[:id])
  if @company.update_attributes(company_params())
      #flash[:notice]="Company succeessfully updated"
    redirect_to(:action=>'show',:id=>@company.id)
  else
    render('edit')
  end
end

def visiting
  @company_visiting = Company.all.where(:visiting=>true)
end

private def company_params()
  params.require(:company).permit(:cin,:c_name, :cpiCriteria,:category,:batch,:c_backlogs,:skills_set,:info,:visiting,:start_date,:end_date,:feedback,company_branches_attributes: CompanyBranch.attribute_names.map(&:to_sym).push(:_destroy),company_ctcs_attributes: CompanyCtc.attribute_names.map(&:to_sym).push(:_destroy))
end

private def name
  params.require(:company).permit(:c_name)
end
end
