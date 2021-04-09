class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    if @user.save
      log_in @user
      flash[:success] = "succeeded creating new user!"
      redirect_to @user
    else
      flash.now[:notice] = "failed to crate a new user!"
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])

  end

  def edit 
    @user = User.find(params[:id])

  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = 'update success'
      redirect_to user_path
    else
      flash[:danger] = 'failed to update'
      render 'edit'

    end

  end
  



  private
  def user_params
    params.require(:user).permit(:first_name, :email, :password, :password_confirmation)
  end


end
