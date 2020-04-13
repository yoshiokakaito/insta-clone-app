require 'rails_helper'

RSpec.describe Micropost, type: :model do
  it "マイクロポストが有効か" do
    expect(FactoryBot.build(:micropost)).to be_valid
  end
  
  it "コンテンツがなければ無効" do
    micropost = FactoryBot.build(:micropost, content: nil)
    expect(micropost).to be_invalid
  end
  
  it "ユーザーidがなければ無効" do
    micropost = FactoryBot.build(:micropost, user_id: nil)
    expect(micropost).to be_invalid
  end
end
