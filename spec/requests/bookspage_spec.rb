require 'rails_helper'

RSpec.describe "Books page", type: :request do
  describe "Books page request check" do
    let(:book) { build(:book) }

    it "returns http success for get add book path" do
      get add_book_path
      # expect(response).to have_http_status(:success)
      expect(response).to redirect_to(sign_in_path)

    end

    it "returns http success for post add request" do
      post add_book_path, :params => {:book => { :title => book.title, :author => book.author, :volume => book.volume, :published_in => book.published_in}}
      # expect(response).to redirect_to(see_books_path)
      expect(response).to redirect_to(sign_in_path)

    end
  end
end
