require 'rails_helper'

RSpec.describe "StaticPages", type: :request do
  describe "GET /home" do
    it "returns http success" do
      get root_path
      expect(response).to have_http_status(:success)
    end

  end

  describe "GET /help" do
    it "returns http success" do
      get "/help"
      expect(response).to have_http_status(:success)
    end
  end

  describe "Get /about" do
    it "returns http success" do
      get "/about"
      expect(response).to have_http_status(:success)
    end
  end

  describe "Get /contact" do
    it "returns http success" do
      get "/contact"
      expect(response).to have_http_status(:success)
    end
  end


end
