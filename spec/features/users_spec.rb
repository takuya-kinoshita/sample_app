require 'rails_helper'

RSpec.feature "Users", type: :feature do
  before do
    @user = FactoryBot.create(:user)
    @other_user = FactoryBot.create(:user)
  end  


  scenario "ユーザーの編集が成功すること" do
    visit edit_user_path(@user)
    click_button "commit"
    expect(page).to have_http_status(200) 
  end 

  scenario "successful edit with friendly forwarding" do
    sign_in(@user)
    visit edit_user_path(@user)
    expect(page).to have_http_status(200) 

  end



end
