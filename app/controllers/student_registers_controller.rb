class StudentRegistersController < ApplicationController

	def create
		@current_student = StudentDetail.find(session[:id])
		@visiting_company = Company.find(params[:id])

		check = StudentRegister.where(:student_detail_id=>@current_student.id,:company_id=>@visiting_company.id)
		if check.count==0 
			r = StudentRegister.create(:student_detail_id=>@current_student.id,:company_id=>@visiting_company.id)
			redirect_to(:action=>'index',:controller=>'student_details')
		else
			flash[:notice]="you are already registered"
			redirect_to(:action=>'eligibility',:controller=>'student_details')
		end
	end

	def show
  		#@company = Company.find(params[:company_id])
  		@student_register = StudentRegister.where(:company_id=>params[:company_id])
	end

	def enter_no_delete
	end

	def destroy
		@s = StudentDetail.find_by_roll_no(params[:roll_no])
		@registered = StudentRegister.where(:company_id=>params[:company_id]).first
		@r = @registered.find_by_student_detail_id(@s.id)
		@r.destroy
		redirect_to(:action=>'show',:controller=>'student_registers')
	end
end
