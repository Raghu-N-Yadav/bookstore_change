require 'rails_helper'

RSpec.feature "See books", type: :feature do
  context 'Features test for books page' do
    let(:book) { build(:book) }
    let(:admin) { build(:user, email: "dev@example.com") }


    before(:each) do
      visit(sign_up_path)
      expect(current_path).to eq(sign_up_path)
      fill_in "Email", with: admin.email
      fill_in "Password", with: admin.password
      fill_in "Confirm password", with: admin.confirm_password
      click_button("Sign Up")
    end

    it 'Check sign Up' do
      visit(sign_up_path)
      expect(current_path).to eq(sign_up_path)
    end

    it 'Visit books page and find add book link' do
      visit(see_books_path)
      expect(current_path).to eq(see_books_path)
      expect(page).to have_link('Add new Book')
      click_link('Add new Book')
      expect(current_path).to eq(add_book_path)
    end

    it 'Go to add book page' do
      visit(see_books_path)
      click_link('Add new Book')
      expect(current_path).to eq(add_book_path)
    end

    it 'Go to add book page and add a book' do
      visit(add_book_path)
      fill_in "Title", with: book.title
      fill_in "Author", with: book.author
      fill_in "Volume", with: book.volume
      fill_in "Published in", with: book.published_in

      click_button("Add Book")
      expect(page).to have_content('Successfully Added book to database')
    end

    it 'Error on adding a book' do
      visit(add_book_path)
      fill_in "Title", with: book.title
      fill_in "Author", with: book.author
      fill_in "Volume", with: book.volume

      click_button("Add Book")
      expect(page).to have_content('Published in can\'t be blank')
    end

    it 'After adding a book Try to issue that book' do
      visit(add_book_path)
      fill_in "Title", with: book.title
      fill_in "Author", with: book.author
      fill_in "Volume", with: book.volume
      fill_in "Published in", with: book.published_in

      click_button("Add Book")
      click_link("Issue Book")
      expect(page).to have_content(book.title)
    end

    it 'After adding a book Try to show details of that book' do
      visit(add_book_path)
      fill_in "Title", with: book.title
      fill_in "Author", with: book.author
      fill_in "Volume", with: book.volume
      fill_in "Published in", with: book.published_in

      click_button("Add Book")
      click_link("Show Details")
      expect(page).to have_content(book.title)
    end

    it 'After adding a book Try remove that book' do
      visit(add_book_path)
      fill_in "Title", with: book.title
      fill_in "Author", with: book.author
      fill_in "Volume", with: book.volume
      fill_in "Published in", with: book.published_in

      click_button("Add Book")
      expect(page).to have_content(book.title)
      click_button("Remove Book")
      expect(page).to have_content("Book removed")
    end

  end
end