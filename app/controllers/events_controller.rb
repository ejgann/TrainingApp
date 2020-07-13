class EventsController < ApplicationController
    def index
        @events = Event.all
    end
    
    def new
        @event = Event.new
    end

    def create
        @event = current_user.events.build(event_params)
        if @event.save
            redirect_to events_path
        else
            render :new
        end
    end

    def show
        @event = Event.find_by(id: params[:id])
    end

    private

    def event_params
        params.require(:event).permit(:title, :category, :description, :length)
    end

end
