class Admin::RecipesController < ApplicationController

  def index
    @recipes = @user.recipes
  end

  def show
    @recipe = Recipe.find(params[:id])
    @post_comment = PostComment.new
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    recipe = Recipe.find(params[:id])
    recipe.update(recipe_params)
    redirect_to admin_recipe_path(recipe.id)
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    redirect_to admin_user_path(user.id)
  end

  private

  def recipe_params
    params.require(:recipe).permit(
      :recipe_name, :introduction, :procedure, :recipe_image, :genre_id,
      ingredients_attributes:[:id, :recipe_id, :name, :amount, :_destroy],
      steps_attributes:[:id, :recipe_id, :description, :_destroy]
      )
  end

end
