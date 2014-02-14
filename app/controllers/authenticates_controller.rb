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
		# Mongoid.yml file must be set to 'raise_not_found_error: false' to return nil if no user found
		if user && user.authenticated?(params[:user][:password])
			session[:user_id] = user.id
			redirect_to workouts_path
		else
			
			flash[:notice] = "User name and/or password is invalid"
  	end
	end

	def destroy
		if current_user
			session[:user_id] = nil
			redirect_to new_authenticate_path
			flash[:notice] = " You have successfully logged off"
		else
			redirect_to new_authenticate_path
			flash[:notice] = " You are not currently logged in"
		end
	end
end