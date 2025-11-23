class UsersController < ApplicationController
  def show
    @user = User.find(current_user.id)
  end

  def index
    @book = Book.new
    @user = User.find(current_user.id)
    @books = @user.books
  end


  def edit
  end



  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
