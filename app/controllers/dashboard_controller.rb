class DashboardController < ApplicationController
    skip_before_action :authenticate_user!,only:[:index]
    
    def index
        redirect_to user_dashboard_path if signed_in? && current_user.user?
        redirect_to admin_dashboard_path if signed_in? && current_user.admin?
    end
    
    def user
        @movies = Movie.all
        @sample = @movies.sample
    end
    
    def admin
    end
    
    def my_history
        @movies = current_user.movies
    end
    
    def search
    end
end
