class ExercisesController < ApplicationController
  def index
  	if current_user
      # @exercises = Exercise.all
      @exercises = current_user.exercises.order_by(:name.asc)
    else
      redirect_to new_authenticate_path
      flash[:notice] = "Please log in first to see your exercises"
    end
  end

  def edit
  	@exercise = Exercise.find(params[:id])
  end

  def new
  	if current_user
      @exercise = Exercise.new
    else
      redirect_to new_authenticate_path
      flash[:notice] = "Please log in before creating a exercise"
    end
  end

  def show
  	if current_user
      @exercise = Exercise.find(params[:id])
     else
      redirect_to new_authenticate_path
      flash[:notice] = "Please log in before viewing a exercise"
    end
  end

  def create
  	@exercise = Exercise.new(exercise_params)
    @exercise.user = current_user 

  	if @exercise.save
  		flash[:notice] = "Successfully Created An Exercise!"
  		redirect_to action: 'index'
  	else
  		render action: 'new'
  	end
  end

  def update
  	@exercise = Exercise.find(params[:id])

  	if @exercise.update(exercise_params)
  		flash[:notice] = "Successfully Updated #{@exercise.name}!"
  		redirect_to action: 'index'
  	else
  		render action: 'edit'
		end
	end

	def destroy
		@exercise = Exercise.find(params[:id])
		@exercise.destroy
		flash[:notice] = "Successfully Deleted Your Exercise!"
		redirect_to action: 'index'
	end

private

	def exercise_params
		params.require(:exercise).permit(:name, :link, :video)	
	end
end
