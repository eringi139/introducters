class Admin::GenresController < ApplicationController
  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    genre = Genre.find(params[:id])
    genre.update(genre_params)
    redirect_to admin_genres_path(genre.id)
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
