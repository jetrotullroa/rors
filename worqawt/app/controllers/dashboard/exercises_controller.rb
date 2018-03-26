class Dashboard::ExercisesController < ApplicationController
  def new
    @exercise = Exercise.new
  end

  def create
    @exercise = current_user.exercises.new(exercise_params)
    if @exercise.save
      redirect_to dashboard_root_path
      flash[:notice] = "Exercise has been completed."
    else
      render :new
    end
  end


  private

    def exercise_params
      params.require(:exercise).permit(:duration, :workout)
    end
end
