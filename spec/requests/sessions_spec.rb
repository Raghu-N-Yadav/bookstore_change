require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "Sessions request check" do

    it "returns http success for get signIn path" do
      get sign_in_path
      expect(response).to have_http_status(:success)
    end

    it "returns http success for post request on signIn path" do
      post sign_in_path
      expect(response).to have_http_status(:success)
    end
  end
end
