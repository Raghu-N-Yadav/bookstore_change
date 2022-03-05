class IssuedBook < ApplicationRecord
  belongs_to :book
  belongs_to :student

  def self.update_book_issue_status(params,student)
    @book = Book.find_by(title: params[:book_issued])
    puts(@book)
    puts "************"
    @book.students << student
    puts(@book.issued_books.first)
    issued_book_record= @book.issued_books.first 
    issued_book_record.issued = true
    issued_book_record.issued_date = params[:issued_date]
    issued_book_record.return_Date = params[:return_date]
    issued_book_record.save

  end

  def self.update_book_return_status(params)
    @book = Book.find(params[:id])
    @book.issued_books.destroy_all
    @book.students.destroy_all

  end
end
