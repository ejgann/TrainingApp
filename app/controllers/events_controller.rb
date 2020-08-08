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

    def edit
        @event = Event.find_by(id: params[:id])
    end

    def update
        @event = Event.find_by(id: params[:id])
        if @event.update(event_params)
            redirect_to @event
          else
            render 'edit'
          end
    end

    def destroy
        @event = Event.find_by(id: params[:id])
        @event.destroy
        redirect_to events_path
    end

    private

    def event_params
        params.require(:event).permit(:title, :category, :description, :length)
    end

end
