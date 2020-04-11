require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.build(:user) }
  
  it "名前、user name、メール、パスワードがあれば有効" do
    expect(user).to be_valid
  end
  
  it "名前がなければ無効" do
    user.name = " "
    expect(user).to be_invalid
  end
  
  it "ユーザーネームがなければ無効" do
    user.user_name = " "
    expect(user).to be_invalid
  end
  
  describe "address" do
  
    it "メールアドレスがなければ無効" do
      user.email = " "
      expect(user).to be_invalid
    end
    
    it "正しくないメールアドレスは無効" do
      addresses = %w[user_at_foo.org example.user@foo.foo@bar_baz.com foo@bar+baz.com foo@bar..com]
      addresses.each do |address|
        expect(FactoryBot.build(:user, email: address)).to be_invalid
        # なぜかexpect(user.email = address).to be_invalid だとバリデーションが効かない
      end
    end  
    
    it "重複したメールアドレスは無効" do
      FactoryBot.create(:user, email: "aaron@example.com")
      user.email = "aaron@example.com"
      expect(user).to be_invalid
    end
    
    it "メールアドレスは大文字小文字を同じ値にしているか" do
      user.email = "Foo@ExAMPle.CoM"
      user.save!
      expect(user.reload.email).to eq "foo@example.com"
    end
  end
  
  describe "password" do
    
    it "パスワードがなければ無効" do
      user.password = user.password_confirmation = "a" * 6
      expect(user).to be_valid
      
      user.password = user.password_confirmation = " " * 6
      expect(user).to be_invalid
    end
  
    it "パスワードが６桁なら正しい" do
      user.password = user.password_confirmation = "a" * 6
      expect(user).to be_valid
    end

    it "パスワードが５桁なら正しくない" do
      user.password = password_confirmation = "a" * 5
      expect(user).to be_invalid
    end
  end
end
