class BooksController < ApplicationController
  before_filter :authenticate, except: [:index]
  before_filter :set_book, only: [:edit, :update]

  def index
    @books = Book.ordered
  end

  def new
    @book = Book.new
  end

  def create
    if book_params[:isbn].present? && book_params[:title].blank? && book_params[:authors].blank?
      BookCreatorWorker.perform_async(book_params[:isbn], book_params[:quantity])
      redirect_to books_path
    else
      @book = Book.new book_params
      @book.save
      respond_with @book, location: books_path
    end
  end

  def update
    @book.update(book_params)
    respond_with @book, location: books_path
  end

  protected

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params
      .require(:book)
      .permit(:isbn, :title, :authors, :quantity)
  end
end
