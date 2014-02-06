class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def new
  	@user = User.new
    ## Clear notice from reappearing automatically after initial submission error
    flash[:notice] = nil
  end

  def create
    @user = User.new(params.require(:user).permit(:username, :password))
    if @user.save
      redirect_to workouts_path, notice: "Thank you for signing up!"
    else
      flash[:notice] = "There is an error with your submission. Please make sure that the form is completely filled."
      render 'new'
    end
  end
end