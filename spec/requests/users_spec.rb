require 'rails_helper'

RSpec.describe "Users", type: :request do
  before do
    @user = FactoryBot.create(:user)
    @other_user = FactoryBot.create(:user)
  end

  describe "edit" do
    context "ログインしていないとき" do
      it "ログインページにリダイレクトされること" do
        get edit_user_path(@user)
        expect(page).to redirect_to login_path
      end
    end  


    context "ログインしているとき" do
      it "編集が成功すること" do
        sign_in(@user)
        get edit_user_path(@user)
        post users_path, params: {user: {first_name: "takuya", email: "kkk@gmail.com",
				password: "password",
				password_confirmation: "password"
						}}
        expect(response.body).to_not include("error")
        expect(response).to have_http_status(302)
       end
    end



  end
end
