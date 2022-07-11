class ListsController < ApplicationController
  def new
    @book = Booker.new
  end
  
  def create
    book = Booker.new(booker_params)
    book.save
    redirect_to '/lists'
  end

  def index
  end

  def show
  end

  def edit
  end
  
  def booker_params
    params.require(:booker).permit(:title, :body)
  end
end
