class WorkoutsController < ApplicationController
  def index
    # Make sure user is logged in before showing index page
    if current_user
      @workouts = Workout.all
      @date = Date.today
    else
      redirect_to new_authenticate_path
      flash[:notice] = "Please log in first to see your workouts"
    end
  end

  def new
    # Make sure user is logged to prevent creating workouts
    if current_user
      @workout = Workout.new
    else
      redirect_to new_authenticate_path
      flash[:notice] = "Please log in before creating a workout"
    end
  end

  def show
    # Make sure user is logged to prevent seeing workouts
    if current_user
      @workout = Workout.find(params[:id])
     else
      redirect_to new_authenticate_path
      flash[:notice] = "Please log in before viewing a workout"
    end
  end

  def edit
  	@workout = Workout.find(params[:id])
  end

  def create
  	@workout = Workout.new(workout_params)

  	if @workout.save
  		flash[:notice] = "Successfully Created A Workout!"
  		redirect_to action: 'index'
  	else
  		render action: 'new'
  	end
  end

  def update
  	@workout = Workout.find(params[:id])

  	if @workout.update(workout_params)
  		flash[:notice] = "Successfully Updated Your Workout!"
  		redirect_to action: 'index'
  	else
  		render action: 'edit'
		end
	end

	def destroy
		@workout = Workout.find(params[:id])
		@workout.destroy
		flash[:notice] = "Successfully Deleted Your Workout!"
		redirect_to action: 'index'
	end

	private

	def workout_params
		params.require(:workout).permit(:body_part, :exercise, :workout_date)	
	end
end
