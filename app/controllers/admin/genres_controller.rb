class Admin::GenresController < ApplicationController
  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def edit
  end

  def update
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
     redirect_to admin_genres_path(@genre)
    else
    @genres = Genre.all
    render :index
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name)

  end
end
