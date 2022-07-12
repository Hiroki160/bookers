class ListsController < ApplicationController
  def new
    @book = Booker.new
  end

  def create
    book = Booker.new(book_params)
    book.save
    redirect_to lists_path(book.id)
  end

  def index
    @books = Booker.all
  end

  def show
    @book = Booker.find(params[:id])
  end

  def edit
  end

  def book_params
    params.require(:booker).permit(:title, :body)
  end
  
end


