class MoviesController < ApplicationController
    helper_method :get_session
    
    def new
        session[:title] = params[:title]
        session[:year] = params[:year]
        session[:description] = params[:description]
        session[:director] = params[:director]
        session[:number_of_cast] = params[:number_of_cast].to_i
        session[:number_of_starring] = params[:number_of_starring].to_i
        session[:age] = params[:age]
        session[:hour] = params[:hour]
        session[:minute] = params[:minute]
        @movie = Movie.new
        respond_to do |format|
            format.js 
        end
    end
    
    def before_new
        
    end
    
    def create
        byebug
    end
    
    private
    def get_session(key)
        session[key]
    end
end
