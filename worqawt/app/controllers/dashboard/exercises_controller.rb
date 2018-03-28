class Dashboard::ExercisesController < ApplicationController
  before_action :set_exercise, only: [:edit, :update, :destroy]
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

  def edit
  end

  def update
    if @exercise.update(exercise_params)
      redirect_to dashboard_root_path, notice: "Exercise has been updated."
    else
      render :edit
    end
  end

  def destroy
    @exercise.destroy
    redirect_to dashboard_root_path, notice: "Exercise successfully deleted."
  end

  private
    def set_exercise
      if current_user.exercises.exists?(params[:id])
        @exercise = current_user.exercises.find(params[:id])
      else
        redirect_to dashboard_root_path
        flash[:error] = "Exercise does not exist."
      end
    end

    def exercise_params
      params.require(:exercise).permit(:duration, :workout, :workout_date)
    end
end
