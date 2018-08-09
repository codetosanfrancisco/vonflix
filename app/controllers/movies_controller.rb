class MoviesController < ApplicationController
    before_action :get_movie,only:[:show,:watch_alone]
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
        session[:number_of_audio] = params[:audio].to_i
        session[:number_of_subtitle] = params[:subtitle].to_i
        @movie = Movie.new
        respond_to do |format|
            format.js 
        end
    end
    
    def before_new
        
    end
    
    def create
        @movie = Movie.new(movie_params).save
        Movie.last.create_detail(detail_params)
        flash[:success] = "Movie is successfully added."
        redirect_to admin_dashboard_path
    end
    
    def show
        
    end
    
    def watch_alone
        
    end
    
    def watch_with_friends
        
    end
  
    private
    def get_session(key)
        session[key]
    end
    
    def movie_params
        {title: get_session(:title),year: get_session(:year),age: get_session(:age),hour: get_session(:hour),minute: get_session(:minute),
        description: get_session(:description),starring: params[:movie][:starring],director: get_session(:director),video: params[:movie][:video],images: params[:movie][:images]}
    end
    
    def detail_params
        {adjective: params[:movie][:movie_detail][:adjective],audio: params[:movie][:movie_detail][:audio],subtitle: params[:movie][:movie_detail][:subtitle],
        cast: params[:movie][:movie_detail][:cast]}
    end
    
    def get_movie
        @movie = Movie.find(params[:id])
    end
end
