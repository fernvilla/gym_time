class EntriesController < ApplicationController
  def index
    if current_user
      # @entries = Entry.all
      @entries = current_user.entries.order_by(:entry_date.desc)
    else
      redirect_to new_authenticate_path
      flash[:notice] = "Please log in first to see your entries"
    end
  end

  def edit
  	@entry = Entry.find(params[:id])
  end

  def new
  	if current_user
      @entry = Entry.new
    else
      redirect_to new_authenticate_path
      flash[:notice] = "Please log in before creating a entry"
    end
  end

  def show
  	if current_user
      @entry = Entry.find(params[:id])
     else
      redirect_to new_authenticate_path
      flash[:notice] = "Please log in before viewing a entry"
    end
  end

  def create
  	@entry = Entry.new(entry_params)
    @entry.user = current_user 

  	if @entry.save
  		flash[:notice] = "Successfully Created An Entry!"
  		redirect_to action: 'index'
  	else
  		render action: 'new'
  	end
  end

  def update
  	@entry = Entry.find(params[:id])

  	if @entry.update(entry_params)
  		flash[:notice] = "Successfully Updated Your Entry!"
  		redirect_to action: 'index'
  	else
  		render action: 'edit'
		end
	end

	def destroy
		@entry = Entry.find(params[:id])
		@entry.destroy
		flash[:notice] = "Successfully Deleted Your Entry!"
		redirect_to action: 'index'
	end

  private

	def entry_params
		params.require(:entry).permit(:title, :entry_date, :content, :exercise, :exercise_two, :exercise_three, :reps, :reps_two, :reps_three, :sets, :sets_two, :sets_three, :lbs, :lbs_two, :lbs_three )	
	end
end

