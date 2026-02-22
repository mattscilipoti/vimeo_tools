require 'rails_helper'

RSpec.describe "Overviews", type: :request do
  describe "GET /overview" do
    it "redirects to login when not authenticated" do
      get "/overview"
      expect(response).to redirect_to('/login')
    end
  end
end
