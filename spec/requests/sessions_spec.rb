require 'rails_helper'

RSpec.describe "Sessions", type: :request do
   before do
     visit login_path
   end

   describe '無効な値が入力されたとき' do
    before do
      fill_in "Email", with: " "
      fill_in "Password", with: " "	
      click_button 'Log in'
    end
    subject { page }
    it "gets a flash message" do
      expect(page).to have_selector('.alert-danger', text: 'failed')
    end
 
    context '違うページに遷移したとき' do
      before { visit root_path }
      #フラッシュメッセージが消えること
      it 'フラッシュメッセージが消えること' do
        expect(page).to_not have_selector('.alert-danger', text: 'failed')
      end
    end
  end


  describe '新規ユーザーが作成されたとき' do
    before do
      get signup_path
      @user = User.create(first_name: "aaa",
			last_name: "bbb",
			email: "abc@gmail.com",
			password: "password",
			password_confirmation: "password")
    end
   
    it 'ユーザーページに遷移すること' do
      expect(response).to have_http_status(200) 
    end
  
  end 
    
     describe 'POST #create' do
     context "正しい情報が入力されたとき" do     
     before do
     # before block の外に変数を渡すには@を付けないといけない
     # User.newだと保存されないから、idが付与されず、redirect_toが成功しない
     @user = User.create(first_name: "aaa",
			last_name: "bbb",
			email: "abc@gmail.com",
			password: "password",
			password_confirmation: "password")
      end


      it 'ログインとリダイレクトが成功すること' do
      post '/login', params: { session: { email: @user.email, password: @user.password } }
      expect(response).to redirect_to user_path(@user) 
      expect(is_logged_in?).to be_truthy
      end

      it 'ログアウトが成功すること' do
        delete logout_path
	expect(is_logged_in?).to_not be_truthy
 
      end     
  end  
 end

  context "無効なデータが入力されたとき" do
    before do
	@user = User.create(first_name: "takuya", 
				last_name: "kinoshita",
				email: "xxx",
				password: "aaa",
				password_confirmation: "bbb")
 
    end

    it 'ログインしていないこと' do
    # emailをnilとするとnilclassエラーとなる


        post '/login', params: { session: { email: "xxx", password: "invalid" } }
          expect(is_logged_in?).to_not be_truthy
    end
 end
end

