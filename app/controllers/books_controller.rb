class BooksController < ApplicationController
  def top
  end
    def new
    end

  def create
    @book = Booker.new(book_params)
    @books = Booker.all


    if @book.save
      flash[:notice] = "Book was succesfully created"
      redirect_to book_path(@book.id)
    else
      render :new
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
      flash[:notice] = "Book was succesfully updated"
      redirect_to book_path
    else
      render :edit
    end
  end

  def destroy
    @book = Booker.find(params[:id])
    if @book.destroy
      flash[:notice] = "Book was succesfully destroyed"
      redirect_to books_path
    else
      flash.now[:alert] = "Failed to be destroyed"
      render :index
    end
  end

  private
  def book_params
    params.require(:booker).permit(:title, :body)
  end

end


