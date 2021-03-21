class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    if @user.save
      flash[:notice] = "succeeded creating new user!"
      redirect_to @user
    else
      flash.now[:notice] = "failed to crate a new user!"
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])

  end





  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end


end
