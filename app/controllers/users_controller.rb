class UsersController < ApplicationController
  def show
    # display current user info (my account page)
    @user = User.find_by_username(params[:id])
  end

  def new
  end

  def create
  end
end
