class Public::UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  def show
    @user = User.find(params[:id])
    @recipes = @user.recipes
  end

  def edit
    @user = User.find(params[:id])
  end

  def favorites
      @user = User.find(params[:id])
      @favorite_recipes = @user.favorite_recipes
  end

  def update
    user = current_user
    user.update(user_params)
    redirect_to user_path
  end

  def destroy
    user = current_user
    user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :profile)
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path
    end
  end
end
