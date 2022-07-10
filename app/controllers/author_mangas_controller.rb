class AuthorMangasController < ApplicationController

  def index
    author = Author.find(params[:author_id])
    @mangas = author.mangas
  end


end
