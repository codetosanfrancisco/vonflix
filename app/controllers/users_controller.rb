class UsersController < ApplicationController
  
  skip_before_action :authenticate_user!
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.email.downcase!
     
    if @user.save
      # If user saves in the db successfully:
      session[:user_id] = @user.id #Put the user id in the session
      flash[:success] = "You have signed up successfully."
      redirect_to user_dashboard_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end
  
  private 
  def user_params
    params.require(:user).permit(:firstname,:lastname, :email, :password, :password_confirmation)
  end
end
