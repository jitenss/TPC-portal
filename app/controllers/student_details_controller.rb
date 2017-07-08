class StudentDetailsController < ApplicationController
	before_action :authenticate_user!

	#layout('index')
	#before_action :confirm_logged_in, :except=>[:login,:attempt_login,:logout,:new]
	#before_action :if_logged_in,:only=>[:login]

	def index
			@students = StudentDetail.all
			authorize! :read,@students
	end

	def show
		authorize! :read,@students
		@student = StudentDetail.where(rollNo()).first
	end

	def new
		@student = StudentDetail.new
	end

	def create
		@student = StudentDetail.new(s_params)

		if @student.save
			flash[:notice] ="created"
			redirect_to(:action=>'index')
		else
			render('new')
		end
	end

	def edit
		authorize! :update,@students
		@student = StudentDetail.where(rollNo()).first
	end

	def update
		@student = StudentDetail.find(params[:id])

		if @student.update_attributes(s_params)
			redirect_to(:action=>'index')
		else
			render('edit')
		end
	end

	def delete
		authorize! :destroy,@students
		@student = StudentDetail.where(rollNo()).first
	end

	def destroy
		@student = StudentDetail.find(params[:id])
		@student.destroy
		redirect_to(:action=>'index')
	end

	def enter_no_show
		authorize! :read,@students
		#@stud=StudentDetail.new
	end

	def enter_no_edit
		authorize! :read,@students

	end

	def enter_no_delete
		authorize! :read,@students
	end

	def eligibility
		@current_student = StudentDetail.find(session[:id])
		@visiting_company = Company.find(params[:id])
		@check_eligibility = (@current_student.cpi_6>=@visiting_company.cpiCriteria)&&(@current_student.batch==@visiting_company.batch)&&(@current_student.s_backlogs<=@visiting_company.c_backlogs)
	end

#----------------------------------------------------------------------------
	private
	def s_params

		params.require(:student).permit(:s_name,:batch,:roll_no,:branch,:gender,:date_of_birth,:contact_no_1,:contact_no_2,:email,:s_backlogs,:spi_1,:spi_2,:spi_3,:spi_4,:spi_5,:spi_6,:spi_7,:cpi_6,:cpi_7,:percent_10,:percent_12,:resume)

	end

	def rollNo
		params.require(:stud).permit(:roll_no)
	end



end
