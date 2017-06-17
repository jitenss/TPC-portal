class LoginStudentsController < ApplicationController

	before_action :confirm_logged_in, :except=>[:login,:attempt_login,:logout,:new]

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
			redirect_to(:action=>'index')
		else
			redirect_to(:action=>'login')
		end
	end

	def logout
		session[:roll_no] = nil
		redirect_to(:action=>'login')
	end

	private 
	def confirmed_logged_in
		unless session[:roll_no]
			redirect_to(:action=>'login')
			return false
		else
			return true
		end
	end


end
