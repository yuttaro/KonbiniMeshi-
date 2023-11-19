class Public::HomesController < ApplicationController
  def top
    @recipes = Recipe.all.limit(4)
  end

  def about

  end
end
