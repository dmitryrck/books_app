class BooksController < ApplicationController
  def index
    @books = Book.ordered
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new book_params
    @book.save
    respond_with @book, location: books_path
  end

  protected

  def book_params
    params
      .require(:book)
      .permit(:isbn, :title, :authors)
  end
end
