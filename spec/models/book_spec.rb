require 'rails_helper'

RSpec.describe Book, type: :model do
  let(:book) {create(:book)} 
  let(:student) {create(:student, name: "jhon")}
  let(:my_book) {build(:book)} 
  params = {name:"jhon", email: "jhon@gmail.com", book_issued: "MyString"}

  
  describe 'schema' do
    it { should have_db_column(:title).of_type(:string) }
    it { should have_db_column(:author).of_type(:string) }
    it { should have_db_column(:published_in).of_type(:integer) }
    it { should have_db_column(:volume).of_type(:integer) }
    
  end
  
  describe 'associations' do
    it { should have_many(:students) }
    it { should have_many(:issued_books) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:author) }
    it { should validate_presence_of(:published_in) }
    it { should validate_presence_of(:volume) }
    # it { should validate_uniqueness_of(:title).ignoring_case_sensitivity }
    
  end
  
  describe 'methods' do
    it 'check_issue_status ' do
      expect{ Book.check_issue_status}.to raise_error(ArgumentError)
    end

    it 'check update_book_issue_status' do
      expect{ IssuedBook.update_book_issue_status}.to raise_error(ArgumentError)
    end

    it 'check returned_book' do
      expect{ IssuedBook.update_book_return_status}.to raise_error(ArgumentError)
    end
  end


  describe 'create' do
    it { expect { my_book.save}.to change(Book, :count).by(1) }
  end
  
  it 'give error on Adding Book' do
    my_book.title = nil
    expect(my_book.save).to eq(false)  
  end


  describe 'vaidating book data' do
    it 'vaidate that book is not issued' do
      @book = book
      expect(Book.check_issue_status(@book.title)).to eq(false)
    end

    it 'vaidate if book is issued can\'t issue it again' do
      @book = book
      Student.update_student(params)
      expect(Book.check_issue_status(@book.title)).to eq(true)
    end

    it 'update book status after issuing it' do
      @book =book
      IssuedBook.update_book_issue_status(params,student)
      expect(Book.check_issue_status(@book.title)).to eq(true)
    end

    it 'Check book is returned after book is returned' do
      @book = book
      IssuedBook.update_book_issue_status(params, student)
      expect(Book.check_issue_status(@book.title)).to eq(true)
      IssuedBook.update_book_return_status(@book)
      expect(Book.check_issue_status(@book.title)).to eq(false)
    end
  end
end
