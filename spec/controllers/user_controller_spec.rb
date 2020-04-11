require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "#new" do
    it "正常にレスポンスを返す" do
      get :new
      expect(response).to have_http_status(:success)
    end
    
    it "エラーメッセージの確認" do
     user = User.new
     user.valid?
     expect(user.errors.messages[:name]).to include("can't be blank")
    end
  
  end

end