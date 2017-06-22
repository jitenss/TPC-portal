class TpcLoginController < ApplicationController
  def login
	end

	def attempt_login
		if params[:username].present? && params[:password].present?
      found_user=User.where("username='TPC'").first
			if (params[:username]==found_user.username && params[:password]==found_user.password)
			     session[:username] = found_user.username
			     flash[:notice]="logged in"
			     redirect_to(:controller=>:tpc_members,:action=>'index')
         else
          redirect_to(:action=>'login')
      end
		else
			redirect_to(:action=>'login')
		end

	end

	def logout
		session[:username] = nil
		redirect_to(:action=>'login')
	end
end
