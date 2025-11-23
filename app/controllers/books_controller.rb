class BooksController < ApplicationController

  def create
    @book = Book.new
    @book.user_id = current_user.id
    @book.save
    redirect_to books_parh
  end

  def index
    @book = Book.new
    books = Book.all
    @user = User.find(current_user.id)
    @books = @user.books
  end

  def show
    book = Book.find(params[:id])
  end



  private
  def book_params
    params.require(:book).permit(:title, :body, :image)
  end

end
