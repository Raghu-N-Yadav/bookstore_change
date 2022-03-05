require 'rails_helper'

RSpec.feature "sig in/sign up", type: :feature do
  let(:user) { build(:user, email: "dev@example.com") }

  describe 'without sign in check all links' do
    it ' should visit home page' do
      visit(root_path)
      expect(find('h1')).to have_content('Sign In / Sign Up as Admin')
    end

    it 'should visit sign in page' do
      visit(root_path)
      click_button "Sign In"
      expect(page).to have_content("Sign In")
    end

    it 'should visit sign Up page' do
      visit(root_path)
      click_button "Sign Up"
      expect(page).to have_content("Sign Up")
    end
  end

  describe 'check path' do 
    it'should confirm sign_up Path' do
      visit(root_path)
      click_button "Sign In"
      expect(current_path).to eq(sign_in_path)
    end
  end
  
  describe 'signup and login' do 

    before :each do
      visit sign_up_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      fill_in 'Confirm password', with: user.confirm_password
      click_button 'Sign Up'
      expect(page).to have_content("Successfully created account")
    end

    it 'should check fro successful sign up' do
      expect(page).to have_content("Successfully created account")
    end

    it 'should logout successfully' do
      click_button('Logout')
      expect(page).to have_content("Logged out")
    end

    it 'should login user' do
      click_button('Logout')
      click_link("Login")
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button("Sign In")
      expect(page).to have_content("Logged In Successfully")
    end
  end
end