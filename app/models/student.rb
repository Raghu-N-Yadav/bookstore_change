class Student < ApplicationRecord
  validates :email, format: {with: /[a-z0-9]+@[a-z]+\.[a-z]{2,3}/}, presence: true
  validates :name, presence: true
  has_many :issued_books
  has_many :books, through: :issued_books


  def self.valiadte_student(params)
    !(params[:name].empty? && params[:email].empty? && params[:issued_date].empty? && params[:return_date].empty?)
  end

  def self.update_student(params)
    if Student.find_by(name: params[:name]).present?
      @student = Student.find_by(name: params[:name])
      IssuedBook.update_book_issue_status(params,@student)
      # redirect_to see_books_path, notice: "Book Issued"
    else
      @student = Student.create(name: params[:name],email: params[:email])
      IssuedBook.update_book_issue_status(params,@student)
      # redirect_to see_books_path, notice: "Book Issued"
    end
  end
end
