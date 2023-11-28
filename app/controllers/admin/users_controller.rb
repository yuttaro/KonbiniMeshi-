class Admin::UsersController < ApplicationController

  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
    @recipes = @user.recipes
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to admin_user_path(user.id)
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to admin_users_path
  end

  def user_params
    params.require(:user).permit(:name, :email, :profile)
  end

end
