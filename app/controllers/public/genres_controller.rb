class Public::GenresController < ApplicationController

  def index
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.save
  end
end

private

  def genre_params
    params.require(:genre).permit(:name)
  end
