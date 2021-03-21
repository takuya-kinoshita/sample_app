require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get signup_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /new" do

    context "無効なユーザー情報が入力された場合" do
     it "登録が失敗すること" do
     end
   end
  end
end
