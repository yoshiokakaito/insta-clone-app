require 'rails_helper'

RSpec.feature "Users", type: :feature do
  scenario "ユーザー登録できるか" do
    user = FactoryBot.build(:user)
    visit signup_path
    
    expect {
      fill_in "ユーザーネーム", with: user.user_name
      fill_in "名前", with: user.name
      fill_in "メールアドレス", with: user.email
      fill_in "パスワード", with: user.password_digest
      fill_in "確認", with: user.password_digest
      click_button "登録"
    }.to change(User, :count).to(1)
  end
  
  scenario "エラーメッセージが正しく表示されるか" do
    visit signup_path
   
    click_button "登録"
    expect(page).to have_content("can't be blank")
  end
  

end
