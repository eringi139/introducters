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
    @genre.save
    redirect_to admin_genres_path(@genre)
  end
  
  private

  def genre_params
    params.require(:genre).permit(:name, :post_id)

  end
end
