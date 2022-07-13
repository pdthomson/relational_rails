class MangasController < ApplicationController

  def index
    @mangas = Manga.all
  end

  def show
    @manga = Manga.find(params[:id])
  end

  def edit
    @manga = Manga.find(params[:id])
  end

  def update
    @manga = Manga.find(params[:id])
    @manga.update(manga_params)
    redirect_to "/mangas/#{@manga.id}"
  end

  def delete
    @manga = Manga.find(params[:id])
    @manga.destroy
    redirect_to '/mangas'
  end

  private
  def manga_params
    params.permit(:name, :completed, :number_of_chapters)
  end
end
