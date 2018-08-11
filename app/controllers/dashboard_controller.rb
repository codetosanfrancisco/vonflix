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
        @movies = Movie.all
    end
    
    def my_history
        @movies = current_user.movies
    end
    
    def search
        @movies = Movie.search(params[:search])
        respond_to do |format|
            format.js
        end
    end
end
