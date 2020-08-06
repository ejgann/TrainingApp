class SessionsController < ApplicationController
    skip_before_action :redirect_if_not_logged_in

    def index
    end
    
    def new
    end
    
    def create
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id 
            redirect_to root_path
        else
            flash[:message] = "Incorrect login info. Please try again."
            redirect_to login_path
        end
    end
    
    def destroy
        session.clear
        redirect_to root_path
    end

end
