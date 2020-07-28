class TrainingsController < ApplicationController
    
    def index
        if  params[:workout_id] && workout = Workout.find_by_id(params[:workout_id])
            # if workout_id is nested via params[:workout_id]
            # and if it can be found in the database
            @trainings = workout.trainings
            # access only the trainings  associated with that specific workout   
        else
            @trainings = Training.all
        end
    end
    
    def new
        if params[:workout_id] && @workout = Workout.find_by_id(params[:workout_id])
            @training = @workout.trainings.build
        else
            @training = Training.new
            @training.build_workout
        # this allows for the nested workout form in the new training view to have a workout instance to which it can be associated...without this, the nested workout portion disappears
        # Also used since this is a belongs_to relationship
        end
    end

    def create
        if params[:workout_id] && @workout = Workout.find_by_id(params[:workout_id])
            @training = @workout.trainings.build(training_params)
        else
            @training = Training.new(training_params)
        end
        
        if @training.save
            redirect_to trainings_path
        else
            render :new
        end
    end

    def show
        @training = Training.find(params[:id])
    end

    private

    def training_params
        params.require(:training).permit(:date, :notes, :event_id, :workout_id, workout_attributes:[:name, :category, :duration, :intensity, :user_id])
        # included :user_id because the model folders don't have access to Application_Controller, where current_user is defined. So have to include the user in the parameters
    end

end
