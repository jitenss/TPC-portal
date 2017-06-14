class StudentDetailsController < ApplicationController

	#layout('index')

	def index
		@students = StudentDetail.all
	end

	def show
		@student = StudentDetail.find(s_params)
	end

	def enter_no
		#@student = StudentDetail.find(s_params)
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
		@student = StudentDetail.find(s_params)
	end

	def update
		@student = StudentDetail.find(s_params)

		if @student.update_attributes(s_params)
			redirect_to(:action=>'index')
		else
			render('edit')
		end
	end

	def delete
		@student = StudentDetail.find(s_params)
	end

	def destroy
		@student = StudentDetail.find(s_params).destroy
		redirect_to(:action=>'index')
	end

	private
	def s_params
		params.require(:student_form).permit(:id,:s_name,:batch,:roll_no,:branch,:gender,:date_of_birth,:contact_no_1,:contact_no_2,:email,:spi_1,:spi_2,:spi_3,:spi_4,:spi_5,:spi_6,:spi_7,:cpi_6,:cpi_7,:percent_10,:percent_12)
	end

end
