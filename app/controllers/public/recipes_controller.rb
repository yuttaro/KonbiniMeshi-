class Public::RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
    @ingredient = @recipe.ingredients.build
    @step = @recipe.steps.build
  end

  def index
    @recipes = Recipe.all
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    if @recipe.save
        redirect_to user_path(@recipe.user.id)
    else
      render :new
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @post_comment = PostComment.new
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
        redirect_to recipe_path(@recipe.id)
    else
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id]) # recipe変数を定義
    @recipe.destroy # レコードを削除
    redirect_to user_path(@recipe.user.id) # リダイレクト先に@recipeを使用
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
