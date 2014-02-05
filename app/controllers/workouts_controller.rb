class WorkoutsController < ApplicationController
  def index
  	@workouts = Workout.all
  end

  def new
  	@workout = Workout.new
  end

  def show
  	@workout = Workout.find(params[:id])
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
		params.require(:workout).permit(:bodypart, :exercise, :workout_date)	
	end
end
