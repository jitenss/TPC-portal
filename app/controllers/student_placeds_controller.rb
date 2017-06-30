class StudentPlacedsController < ApplicationController
	
	def enter_no_placed
	end

	def new
  	@company = Company.where(:c_name=>params[:c_name]).first
  	@recruited = StudentPlaced.new 
  end

  def create
  	@placed = StudentPlaced.new(placed_params)

  	if @placed.save
  		redirect_to(:action=>'index',:controller=>'companies')
  	else
  		render(:action=>'new')
  	end
  end

  def show
    #@company = Company.find(params[:id])
    @student = StudentPlaced.where(:company_id=>params[:company_id])
  end

  def show_all
    @student = StudentPlaced.all
  end

  private
  def placed_params
  	params.require(:placed).permit(:company_id,:student_detail_id,:ctc,:position,:type)
  end
end
