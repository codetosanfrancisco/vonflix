class DashboardController < ApplicationController
    skip_before_action :authenticate_user!,only:[:index]
    
    def index
        redirect_to user_dashboard_path if signed_in?
    end
    
    def user
        @user = current_user
    end
end
