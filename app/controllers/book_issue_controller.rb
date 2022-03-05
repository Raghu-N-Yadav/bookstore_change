class BookIssueController < ApplicationController
  before_action :require_user_logged_in!
  def new
    @book = Book.find(params[:id])
    @student = Student.new
  end

  def show
    @book = Book.find(params[:id])
  end
  
  def create
    @student = Student.new
    @book = Book.find_by(title: params[:book_issued])
    if Book.check_issue_status(params[:book_issued])
      redirect_to see_books_path, alert: "Book Already issued"
    elsif Student.valiadte_student(params)
      # puts Student.find_by(name: params[:name]).id
      Student.update_student(params)
      redirect_to see_books_path, notice: "Book Issued"
    else
      # render :new, status: :unprocessable_entity, id: params[:id]
      redirect_to issue_book_url(id: @book.id), alert: "Students details are not available"
    end
  end

  def return
    IssuedBook.update_book_return_status(params)
    redirect_to see_books_path, notice: "Book Returned"
  end

end