class SessionController < ApplicationController

  def new
   redirect_to dashboard_user_path(session[:user_id]) if logged_in?
  end

  def create

    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:success] = 'Welcome!'
      redirect_to dashboard_user_path(session[:user_id])
    else
      flash[:error] = 'Invalid email/password combination'
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:alert] = 'Logged out.'
    redirect_to login_path
  end

end
