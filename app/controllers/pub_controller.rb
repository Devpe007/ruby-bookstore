class PubController < ApplicationController
  def index
    @books = Book.all
  end

  def sobre
  end

  def book
    @book = Book.find(params[:id])
  end
end
