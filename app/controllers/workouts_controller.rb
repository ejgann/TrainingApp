class WorkoutsController < ApplicationController

    def index
        @workouts = Workout.all
    end

    def new
        @workout = Workout.new
    end

    def create
        @workout = current_user.workouts.build(workout_params)
        if @workout.save
            redirect_to workouts_path
        else
            render :new
        end
    end

    def show
        @workout = Workout.find_by(id: params[:id])
    end

    private

    def workout_params
        params.require(:workout).permit(:name, :category, :duration, :intensity)
    end
end
