class BooksController < ApplicationController

  def create
    @user = User.find(current_user.id)
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "Book was successfully created"
      redirect_to book_path(@book)
    else
      @books = Book.all
      render :index
    end
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = User.find(current_user.id)
  end

  def show
    @book = Book.find(params[:id])
    @user = User.find(current_user.id)
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
    @book = Book.find(params[:id])
    @books = Book.all
  end

  def update
    @user = User.find(params[:id])
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was successfully updated"
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = "Book was successfully destroyed"
    redirect_to books_path
  end



  private
  def book_params
    params.require(:book).permit(:title, :body, :image)
  end

end
