class StudentDetailsController < ApplicationController

	#layout('index')
	before_action :confirm_logged_in, :except=>[:login,:attempt_login,:logout,:new]
	#before_action :if_logged_in,:only=>[:login]

	def index
		@students = StudentDetail.all
	end

	def show
		@student = StudentDetail.where(rollNo()).first
	end

	def new
		@student = StudentDetail.new
	end

	def create
		@student = StudentDetail.new(s_params)

		if @student.save
			flash[:notice] ="created"
			redirect_to(:action=>'login')
		else
			render('new')
		end
	end

	def edit
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
		@student = StudentDetail.where(rollNo()).first
	end

	def destroy
		@student = StudentDetail.find(params[:id])
		@student.destroy
		redirect_to(:action=>'index')
	end

	def enter_no_show
		#@stud=StudentDetail.new
	end

	def enter_no_edit
	end

	def enter_no_delete
	end


	def login
	end

	def attempt_login
		if params[:roll_no].present? && params[:password].present?
			found_user = StudentDetail.where(:roll_no=>params[:roll_no]).first
			if found_user
				authorized_user = found_user.authenticate(params[:password])
			end
		end
		if authorized_user
			session[:id] = authorized_user.id
			flash[:notice]="logged in"
			redirect_to(:action=>'index')
		else
			redirect_to(:action=>'login')
		end

	end

	def logout
		session[:id] = nil
		redirect_to(:action=>'login')
	end

	def eligibility
		@current_student = StudentDetail.find(session[:id])
		@visiting_company = Company.find(params[:id])
		@check_eligibility = (@current_student.cpi_6>=@visiting_company.cpiCriteria)&&(@current_student.batch==@visiting_company.batch)&&(@current_student.s_backlogs<=@visiting_company.c_backlogs)
	end

	def register
		@current_student = StudentDetail.find(session[:id])
		@visiting_company = Company.find(1)

		check = StudentRegister.where(:student_detail_id=>@current_student.id,:company_id=>@visiting_company.id)
		if check.count==0 
			r = StudentRegister.create(:student_detail_id=>@current_student.id,:company_id=>@visiting_company.id)
			redirect_to(:action=>'index')
		else
			flash[:notice]="you are already registered"
			redirect_to(:action=>'eligibility')
		end

	end
#----------------------------------------------------------------------------
	private
	def s_params
		params.require(:student_form).permit(:id,:s_name,:batch,:roll_no,:branch,:gender,:date_of_birth,:contact_no_1,:contact_no_2,:email,:s_backlogs,:spi_1,:spi_2,:spi_3,:spi_4,:spi_5,:spi_6,:spi_7,:cpi_6,:cpi_7,:percent_10,:percent_12,:password)
	end

	def rollNo
		params.require(:stud).permit(:roll_no)
	end

	def confirm_logged_in
		unless session[:id]
			redirect_to(:action=>'login')
			return false
		else
			return true
		end
	end

	def if_logged_in
		if session[:id]!=nil
			redirect_to(:action=>'index')
			return true
		else
			return false
		end
	end

end
