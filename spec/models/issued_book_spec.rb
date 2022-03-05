require 'rails_helper'

RSpec.describe IssuedBook, type: :model do
  let(:book) {create(:book)} 
  let(:student) {create(:student, name: "jhon")}


  describe 'schema' do
    it { should have_db_column(:issued).of_type(:boolean) }
    it { should have_db_column(:issued_to).of_type(:string) }
    it { should have_db_column(:issued_date).of_type(:string) }
    it { should have_db_column(:return_Date).of_type(:string) }
    it { should have_db_column(:book_id).of_type(:integer) }
    it { should have_db_column(:student_id).of_type(:integer) }
  end

  describe 'associations' do
    it { should belong_to(:student) }
    it { should belong_to(:book) }
  end

  describe 'create' do
    it "shold have no data" do
      expect(IssuedBook.count).to eq 0
    end
  end

  describe 'validate data creation' do 
    before(:each) do
      book.students << student
    end

    it "shold have one row" do
      # book.students << student
      expect(IssuedBook.count).to eq 1
    end
    it "should check the name of student" do
      # book.students << student
      expect(book.students.first.name).to eq("jhon")
    end

    it "should check book issued status is false" do
      # puts "************"
      # puts book.issued_books.first.inspect
      # debugger
      expect(book.issued_books.first.issued).to eq(false)
    end
  end
end
