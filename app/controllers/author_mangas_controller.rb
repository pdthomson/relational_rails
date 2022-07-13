class AuthorMangasController < ApplicationController

  def index
    @author = Author.find(params[:author_id])
    @mangas = @author.mangas
    if params[:sort] == 'alpha'
      @mangas = @author.mangas.sort_alphabetically
    elsif params[:number_of_chapters]
      chapters = params[:number_of_chapters].to_i
      @mangas = @author.mangas.where("number_of_chapters > ?", chapters)
    else
      @mangas = @author.mangas
    end
  end

  def new
    @author = Author.find(params[:author_id])
  end

  def create
    @author = Author.find(params[:author_id])
    @author.mangas.create(manga_params)
    redirect_to "/authors/#{@author.id}/mangas"
  end

  private
    def manga_params
      params.permit(:name, :completed, :number_of_chapters)
    end
end
