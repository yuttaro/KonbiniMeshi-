class Admin::GenresController < ApplicationController

  def new
    @genre = Genre.new
  end

  def edit
    @genre = Genre.find(params[:id])
    render :new
  end

  def create
    @genre = Genre.new(genre_params)

    if @genre.save!
      redirect_to genres_path
    else
      render :new
    end

  end

private

  def genre_params
    params.require(:genre).permit(:name)
  end

end
