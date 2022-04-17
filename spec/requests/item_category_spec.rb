require 'rails_helper'

RSpec.describe "ItemCategories", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/item_category/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/item_category/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/item_category/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/item_category/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
