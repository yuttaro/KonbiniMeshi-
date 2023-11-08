class Public::UsersController < ApplicationController

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

  def dereete
    user = current_user
    user.update(user_params)
    redirect_to user_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :profile)

  end
end
