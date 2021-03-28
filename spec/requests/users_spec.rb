require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get signup_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "signup" do
    before do
      visit signup_path
      #let(:submit) { "Create new user"}
    end

    context "無効なユーザー情報が入力された場合" do

     it "登録が失敗すること" do
       user = User.new(first_name: "jiro",
                       last_name: "yamada",
                       email: nil,
                       password: "password",
                       password_confirmation: "password")

       expect(user).to_not be_valid
     end

     it "エラーメッセージが表示されること" do
       user = User.new(first_name: "jiro",
                       last_name: "yamada",
                       email: nil,
                       password: "password",
                       password_confirmation: "password")
        user.valid?
        expect(user.errors[:email]).to include("can't be blank")
     end
   end

    context "有効なユーザー情報が入力された場合" do
        before do
          fill_in "First name", with: "yamada"
	  fill_in "Last name", with: "jiro"
	  fill_in "Email", with: "fff@gmail.com"
	  fill_in "Password", with: "password"
 	  fill_in "Password confirmation", with: "password"
        end

      it "登録が成功すること" do
	expect{ click_button }.to change{User.count}.by(1)
      end

      it "ログイン状態に遷移すること" do
         post '/users', params: { user: { first_name: "takuya", 
					last_name: "kinoshita",
					 email: "aaa@gmail.com",
					 password: "password",
					password_confirmation: "password" }}
#        expect{ click_button }.to redirect_to user_path 
        expect(is_logged_in?).to be_truthy                             
      end

    end  
  end
end 

