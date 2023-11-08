class Public::RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
    @ingredient = @recipe.ingredients.build
  end

  def index
    @recipes = Recipe.all
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    @recipe.save
    redirect_to recipes_path
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
    recipe.update(item_params)
    redirect_to public_recipe_path(recipe.id)
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    redirect_to recipes_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(
      :recipe_name, :introduction, :item, :procedure, :recipe_image, :genre_id,
      ingredients_attributes:[:id, :recipe_id, :name, :amount, :_destroy]
      )
  end

end
