class Book < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :author, presence: true
  validates :published_in, presence: true
  validates :volume, presence: true
  has_many :issued_books
  has_many :students, through: :issued_books

  def self.check_issue_status(title)
    @book = Book.find_by(title: title)
    @book.students.present?
  end

end
