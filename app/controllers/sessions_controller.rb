class SessionsController < ApplicationController
	def new

	end

	def create   # why not just use new function????????????
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			sign_in user
			redirect_to user
		else 
			flash.now[:error] = 'Invalid email/password combination'
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to root_path
	end
		
end
