class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    
    helper_method :signed_in?,:current_user
    private 
    def authenticate_user!
        redirect_to root_path unless session[:user_id]
    end
    def signed_in?
        session[:user_id]
    end
    
    def current_user
        @user ||= User.find(session[:user_id]) if session[:user_id]
    end
    
    def current_room
        @room ||= Room.find(session[:room_id]) if session[:room_id]
    end
end
