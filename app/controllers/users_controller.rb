class UsersController < ApplicationController
  def new
    if current_user
      redirect_to workouts_path
      flash[:notice] = "You already have an account. Logged in as #{current_user.username}"
    else
  	 @user = User.new
     #Clear notice from reappearing automatically after initial submission error
    flash[:notice] = nil
    end
  end

  def create
    @user = User.new(params.require(:user).permit(:username, :password))
    if @user.save
      # Set current_user session. Needed before user can be redirected to workouts page
      session[:user_id] = @user.id 
      redirect_to workouts_path, notice: "Thank you for signing up!"
    else
      flash[:notice] = "Account already exists"
      render 'new'
    end
  end
end