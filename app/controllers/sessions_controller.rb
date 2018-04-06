class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.password == params[:session][:password]
      log_in user
      redirect_to user
    else
      # login failed
      render 'new'
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
