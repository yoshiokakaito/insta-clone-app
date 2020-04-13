require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "#sessions#new" do

    context "ログインに失敗した時" do
      it "フラッシュメッセージの残留をキャッチするか" do
        post login_path, params: { session: { email: "", password: "" } }
        expect(response).to have_http_status(:success)
        expect(flash[:danger]).to be_truthy
        
        get root_path
        expect(flash[:danger]).to be_falsey
      end
    end
  end
  
  describe "#sessions#destory" do
    before do
      @user = FactoryBot.build(:user)
      allow(User).to receive(:find_by).and_return(@user)
    end

    context "ユーザーがログアウトした時" do
      it "falseを返すこと" do

        delete logout_path

        expect(response).to have_http_status(302)
        expect(session[:user_id]).to be_falsey 
      end
    end
  end
end
