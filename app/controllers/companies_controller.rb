class CompaniesController < ApplicationController
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

private def company_params()
  params.require(:company).permit(:cin,:c_name, :cpiCriteria,:category,:batch,:backlogs,:skills_set,:info,company_branches_attributes: CompanyBranch.attribute_names.map(&:to_sym).push(:_destroy))
end
end
