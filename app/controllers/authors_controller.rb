class AuthorsController < ApplicationController

  def index
    @authors = Author.all
  end

  def show
    @author = Author.find(params[:id])
  end

  def new

  end

  def create
      @author = Author.create(author_params)
      redirect_to '/authors'
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])
    @author.update(author_params)
    redirect_to "/authors/#{@author.id}"
  end

  def delete
    @author = Author.find(params[:id])
    @author.mangas.destroy_all
    @author.destroy
    redirect_to '/authors'
  end

  private
    def author_params
      params.permit(:name, :year_published, :award_winner)
    end
end
