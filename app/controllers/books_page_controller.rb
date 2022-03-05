class BooksPageController < ApplicationController
  before_action :require_user_logged_in!
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to see_books_path, notice: "Successfully Added book to database"
    else
      # flash[:alert] = "Fill out Book details"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    redirect_to root_path, status: :see_other, alert: "Book removed"
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :published_in, :volume)
  end
end