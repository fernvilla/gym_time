class WorkoutsController < ApplicationController
  def index
    # Make sure user is logged in (applies to other methods also)
    if current_user
      # @workouts = Workout.all
      # Only show assigned users workots and order them by earliest date for json
      @workouts = current_user.workouts.order_by(:workout_date.asc)
    else
      redirect_to new_authenticate_path
      flash[:notice] = "Please log in first to see your workouts"
    end
  end

  def new
    if current_user
      @workout = Workout.new
    else
      redirect_to new_authenticate_path
      flash[:notice] = "Please log in before creating a workout"
    end
  end

  def show
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
    # Assign workout to current user
    @workout.user = current_user 

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
		params.require(:workout).permit(:body_part, :exercise, :workout_date, exercise_ids: [])	
	end
end
