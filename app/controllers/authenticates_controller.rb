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
			flash[:notice] = "There is an error with your submission. Please make sure that the form is completely filled."
    	render 'new'
  	end
	end

	def destroy
		session[:user_id] = nil
		redirect_to new_authenticate_path
	end
end
