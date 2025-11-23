class HomesController < ApplicationController
  def top
  end

  def about
  end

  def index
    @book = Book.new
    @user = User.find(current_user.id)
    @books = @user.books
  end

end
