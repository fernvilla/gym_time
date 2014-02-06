class AuthenticatesController < ApplicationController

	def new
		# if current_user
		# 	redirect_to episodes_path
		# else
			@user = User.new
		# end
	end

	def create
		user = User.find_by(params[:username])
		if user.authenticated?(params[:user][:password])
			session[:user_id] = user.id
			redirect_to workouts_path
		else
			flash[:notice] = "There is an error with your submission. Please make sure that the form is completely filled."
    	render 'new'
  	end
	end

	def destroy
		session[:user_id] = nil
		redirect_to new_auth_path
	end
end
