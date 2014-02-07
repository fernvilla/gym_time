class AuthenticatesController < ApplicationController
	def new
		if current_user
			redirect_to workouts_path
			flash[:notice] = "You're already logged in as #{current_user.username}"
		else
			@user = User.new
		end
	end

	def create
		user = User.find_by(username: params[:user][:username])
		if user.authenticated?(params[:user][:password])
			session[:user_id] = user.id
			redirect_to workouts_path
		else
				redirect_to new_user_path
				flash[:notice] = "There is an error with your submission. Please make sure that the form is completely filled"
  	end
	end

	def destroy
		if current_user
			session[:user_id] = nil
			redirect_to new_authenticate_path
		else
			redirect_to new_authenticate_path
			flash[:notice] = " You are not currently logged in"
		end
	end
end
