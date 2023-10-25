class Public::RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
  end

  def index
    @recipes = Recipe.all
  end

  def create
    recipe = Recipe.new(recipe_params)
    recipe.save
    redirect_to recipe_path(recipe.id)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    recipe = Recipe.find(params[:id])
    recipe.update(item_params)
    redirect_to public_recipe_path(recipe.id)
  end

  def destroy

  end

  private

  def recipe_params
    params.require(:recipe).permit(:recipe_name, :introduction, :item, :procedure, :profile_image, :genre_id)
  end

end
