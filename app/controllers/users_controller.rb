class UsersController < ApplicationController
  def show
    @book = Book.find(params[:id])
    @user = User.find(current_user.id)
    @books = @user.books
  end

  def index
    @book = Book.new
    @users = User.all
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
