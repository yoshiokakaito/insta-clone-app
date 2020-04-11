require 'rails_helper'

RSpec.feature "Users", type: :feature do
  scenario "ユーザー登録できるか" do
    user = FactoryBot.build(:user)
    visit signup_path
    
    expect {
      fill_in "User name", with: user.user_name
      fill_in "Name", with: user.name
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password_digest
      fill_in "Password confirmation", with: user.password_digest
      click_button "Create my account"
    }.to change(User, :count).to(1)
  end
  
  scenario "エラーメッセージが正しく表示されるか" do
    visit signup_path
   
    click_button "Create my account"
    expect(page).to have_content("can't be blank")
  end
  

end
