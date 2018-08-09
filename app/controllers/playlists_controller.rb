class PlaylistsController < ApplicationController
    def show
        @playlist = Playlist.find(params[:id])
        @movies = @playlist.movies
    end
end
