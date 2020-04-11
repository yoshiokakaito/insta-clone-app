require 'rails_helper'

RSpec.feature "Homes", type: :feature do
  before do
    visit root_path
  end 
  
  scenario "homeページへ遷移できるか" do
    click_link "Home"
    expect(page).to have_content("instagram")
  end
  
  scenario "loginページへ遷移できるか" do
    click_link "Log in"
    expect(page).to have_content("ログイン")
  end
  
  scenario "signupページへ遷移できるか" do
    click_link "Sign up now!"
    expect(page).to have_content("ユーザー登録")
  end
end
