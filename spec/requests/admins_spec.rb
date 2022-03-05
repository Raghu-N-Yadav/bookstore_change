require 'rails_helper'

RSpec.describe "Admins", type: :request do
  describe "GET /index" do
    it "returns http success for root path" do
      get root_path
      expect(response).to have_http_status(:success)
    end
  end
end
