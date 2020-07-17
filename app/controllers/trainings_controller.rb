class TrainingsController < ApplicationController
    
    def index
        if  params[:workout_id] && @workout = Workout.find_by_id(params[:workout_id])
            @trainings = @workout.trainings
        elsif params[:event_id] && @event = Event.find_by_id(params[:event_id])
            @trainings = @event.trainings    
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
        if params[:workout_id] && @workout = Workout.find_by_id(params[:workkout_id])
            @training = @workout.trainings.build            
        else
            @training = Training.new(training_params)
        end
        
        if @training.save
            redirect_to training_path(@training) 
        else
            render :new
        end
    end

    def show
        @training = Training.find(params[:id])
    end

    private

    def training_params
        params.require(:training).permit(:date, :notes, :event_id, :workout_id, workout_attributes:[:name, :category, :duration, :intensity])
    end

end
