class BooksController < ApplicationController
  def top
  end
    def new
    @book = Booker.new
    @books = Booker.all
  end

  def create
    book = Booker.new(book_params)
    book.save
    redirect_to "/books/new"
  end

  def index
    @books = Booker.all
  end

  def show
    @book = Booker.find(params[:id])
  end

  def edit
    @book = Booker.find(params[:id])
  end

  def update
    book = Booker.find(params[:id])
    book.update(book_params)
    redirect_to new_book_path
  end

  def destroy
    book = Booker.find(params[:id])
    book.destroy
    redirect_to new_book_path
  end

  private
  def book_params
    params.require(:booker).permit(:title, :body)
  end

end


