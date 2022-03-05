require 'rails_helper'

RSpec.feature "Home", type: :feature do
  describe 'without logging in' do
    it ' should visit home page' do
      visit(root_path)
      expect(find('h1')).to have_content('Sign In / Sign Up as Admin')
    end
    it 'should redirect to sign in page' do 
      visit(see_books_path)
      expect(current_path).to eq(sign_in_path)
    end
  end

  describe 'after signing up' do
    let(:user) { build(:user, email: "dev@example.com") }

    before :each do
      visit sign_up_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
    end

    it'should throw error' do
      click_button 'Sign Up'
      expect(page).to have_content('Confirm password can\'t be blank')
    end

    it'confirm sign_up Path' do
      click_button 'Sign Up'
      expect(current_path).to eq(sign_up_path)
    end

    it 'does sign up successfully' do
      fill_in 'Confirm password', with: user.confirm_password
      click_button 'Sign Up'
      expect(page).to have_content("Successfully created account")
    end

    it 'should redirect to see books path' do 
      fill_in 'Confirm password', with: user.confirm_password
      click_button 'Sign Up'
      visit(see_books_path)
      expect(current_path).to eq(see_books_path)
    end
    it 'logout successfully' do
      fill_in 'Confirm password', with: user.confirm_password
      click_button 'Sign Up'
      expect(page).to have_content("Successfully created account")
      click_button('Logout')
      expect(page).to have_content("Logged out")
    end
  end
end
