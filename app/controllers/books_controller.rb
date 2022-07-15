class BooksController < ApplicationController
  def top
  end
    def new
    end

  def create
    @book = Booker.new(book_params)
    @books = Booker.all
    if @book.save
      redirect_to books_path
    else
      render :index
    end
  end

  def index
    @books = Booker.all
     @book = Booker.new
  end

  def show
    @book = Booker.find(params[:id])
  end

  def edit
    @book = Booker.find(params[:id])
  end

  def update
    @book = Booker.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path
    else render :edit
    end
  end

  def destroy
    book = Booker.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:booker).permit(:title, :body)
  end

end


