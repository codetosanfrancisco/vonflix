class SessionController < ApplicationController
  skip_before_action :authenticate_user!,except:[:destroy]
  
  def new
    
  end
  
  def create
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password]) 
      session[:user_id] = user.id
      flash[:success] = "You have successfully signed in."
      redirect_to user_dashboard_path if current_user.user?
      redirect_to admin_dashboard_path if current_user.admin?
    else
      flash.now[:danger] = "Incorrect email or password, try again."
      render :new
    end
  end

  def destroy
    # delete the saved user_id key/value from the cookie:
    session.delete(:user_id)
    redirect_to root_path
  end
end
