class HomesController < ApplicationController
  def top
  end

  def about
  end

  def index
    @book = Book.new
  end

end
