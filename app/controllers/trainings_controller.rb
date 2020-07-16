class TrainingsController < ApplicationController
    
    def index
        @trainings = Training.all
    end
    
    def new
        @training = Training.new
        @training.build_workout
        # this allows for the nested workout form in the new training view to have a workout instance to which it can be associated...without this, the nested workout portion disappears
        # Also used since this is a belongs_to relationship
    end

    def create
        @training = Training.new(training_params)
        if @training.save
            redirect_to trainings_path 
        else
            render :new
        end
    end

    # def create
    #     @training = current_user.trainings.build(training_params)
    #     if @training.save
    #         redirect_to trainings_path
    #     else
    #         render :new
    #     end
    # end

    private

    def training_params
        params.require(:training).permit(:date, :notes, :event_id, :workout_id, workout_attributes:[:name, :category, :duration, :intensity])
    end

end
