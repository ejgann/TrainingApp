class TrainingsController < ApplicationController
    
    def index
        @trainings = Training.all
    end
    
    def new
        @training = Training.new
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
        params.require(:training).permit(:date, :notes, :event_id, :workout_id)
    end

end
