class WorkoutsController < ApplicationController
    
    def index
        @workouts = Workout.most_popular
        # replaced .all with workout scope method .most_popular
    end

    def new
        @workout = Workout.new
    end

    def create
        @workout = current_user.created_workouts.build(workout_params)
        if @workout.save
            redirect_to workout_path(@workout)
        else
            render :new
        end
    end

    def show
        @workout = Workout.find_by(id: params[:id])
    end

    def edit
        @workout = Workout.find_by(id: params[:id])
    end

    def update
        @workout = Workout.find_by(id: params[:id])
        if @workout.update(workout_params)
            redirect_to @workout
          else
            render 'edit'
          end
    end

    def destroy
        @workout = Workout.find_by(id: params[:id])
        @workout.destroy
        redirect_to workouts_path
    end

    private

    def workout_params
        params.require(:workout).permit(:name, :category, :duration, :intensity, :user_id)
    end
end
