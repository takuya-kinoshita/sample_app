require 'rails_helper'

RSpec.feature "Users", type: :feature do
  context '有効なユーザー情報が入力されたとき' do
    @user = FactoryBot.create(:user) 
    it '登録が成功すること' do
      expect(@user).to be_valid
    end

  end

end
