class MoviesController < ApplicationController
    before_action :get_movie,only:[:show,:watch_alone,:watch_with_friends,:create_invitation,:accept_invitation,:verify_invitation,:watch_together]
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
        @movie = Movie.new(movie_params)
        if @movie.save
            @movie.create_detail(detail_params)
            flash[:success] = "Movie is successfully added."
            redirect_to admin_dashboard_path
        else
            flash.now[:danger] = "Movies cannot be added."
            render "before_new"
        end
        
    end
    
    def show
        
    end
    
    def watch_alone
        current_user.movies << @movie unless current_user.movies.include?(@movie)
    end
    
    def watch_with_friends
        current_user.movies << @movie unless current_user.movies.include?(@movie)
    end
    
    def create_invitation
        @random_string = SecureRandom.hex(5) + "w=#{params[:id]}"
        @invitation = current_user.invitations.create(movie: @movie,name:"#{current_user.full_name}-#{@movie.title}")
        @invitation.friends << current_user
        @invitation.create_room(name: @random_string)
        session[:room_id] = @invitation.room.id
        respond_to do |format|
            format.js
        end
    end
    
    def accept_invitation
        respond_to do |format|
            format.js
        end
    end
    
    def verify_invitation
        room = Room.find_by_name(params[:invitation_code])
        if room && room.invitation.movie == @movie
            unless room.invitation.friends.size > 5
                room.invitation.friends << current_user unless room.invitation.friends.include?(current_user)
                session[:room_id] = room.id
                flash[:success] = "You have accepted the invitation #{room.invitation.name} created by #{room.invitation.user.full_name}"
                redirect_to watch_together_movie_path(@movie,room: room.id)
            else
                flash[:danger] = "The invitation #{room.invitation.name} created by #{room.invitation.user.full_name} is full."
                redirect_back(fallback_location: root_path)
            end
        else
            flash[:danger] = "Invitation code is incorrect."
            redirect_back(fallback_location: root_path)
        end
    end
    
    def watch_together
        @room_id = params[:room]
        @invitation = Room.find(@room_id).invitation
        @friends = @invitation.friends
        have_access_to_watch_together?
    end
    
    def friends_watching
        @invitation_id = params[:i]
        @count = Invitation.find(@invitation_id).friends.size
        respond_to do |format|
            format.json { render json: @count }
        end
    end
    
    
    def who_is_my_friends
        @invitation = Invitation.find(params[:i])
        friends = @invitation.friends
        @friends_names = friends.collect(&:full_name)
        respond_to do |format|
            format.json { render json: @friends_names}
        end
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
    
    def have_access_to_watch_together?
        unless @friends.include?(current_user)
            flash[:danger] = "You are not invited."
            redirect_back(fallback_location: root_path)
        end
    end
end
