require 'rails_helper'

RSpec.feature "StaticPages", type: :feature do
  scenario "About link is clicked" do
    visit root_path
    click_link "A"
    expect(page).to have_http_status(200)
  end

  scenario "Contact link is clicked" do
    visit root_path
    click_link "C"
    expect(page).to have_http_status(200)
  end

  scenario "Help link works" do
    visit root_path
    click_link "Help"
    expect(page).to have_http_status(200)
  end

  scenario "Singnup link works" do
    visit root_path
    click_link "Sign up now!"
    expect(page).to have_http_status(200)
  end


end
