class StudentDetailsController < ApplicationController

	#layout('index')
	before_action :confirm_logged_in, :except=>[:login,:attempt_login,:logout]
	

	def index
		@students = StudentDetail.all
	end

	def show
		@student = StudentDetail.find(params[:id])
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
		@student = StudentDetail.find(params[:id])
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
		@student = StudentDetail.find(params[:id])
	end

	def destroy
		@student = StudentDetail.find(params[:id])
		@student.destroy
		redirect_to(:action=>'index')
	end

	def enter_no_show
		#@student = StudentDetail.find(s_params)
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
			session[:roll_no] = authorized_user.roll_no
			flash[:notice]="logged in"
			redirect_to(:action=>'index')
		else
			redirect_to(:action=>'login')
		end

	end

	def logout
	end

	private
	def s_params
		params.require(:student_form).permit(:id,:s_name,:batch,:roll_no,:branch,:gender,:date_of_birth,:contact_no_1,:contact_no_2,:email,:spi_1,:spi_2,:spi_3,:spi_4,:spi_5,:spi_6,:spi_7,:cpi_6,:cpi_7,:percent_10,:percent_12,:password)
	end

	def confirm_logged_in
		unless session[:roll_no]
			redirect_to(:action=>'login')
			return false
		else
			return true
		end
	end

end
