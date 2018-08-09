class PlaylistMoviesController < ApplicationController
    def create
        movie = Movie.find(params[:movie_id])
        current_user.playlist.movies << movie
        flash[:success] = "#{movie.title} is added to your playlist."
        redirect_back(fallback_location: root_path)
    end
end
