class UsersController < ApplicationController
  def show
    # display current user info (my account page)
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :first_name,
                                 :last_name, :email, :phone, :address,
                                 :city, :post_code, :province_id)
  end
end
