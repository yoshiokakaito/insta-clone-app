require 'rails_helper'

RSpec.describe "Users", type: :request do

  let(:params){
      {name: "Aaron",
      user_name: "Sumner",
      email: "tester@example.com",
      password_digest: "dottle-nouveau-pavilion-tights-furze",}
  }
  before do
    signup_path
  end
  
  describe "#create" do
    it "postデータの受け取りができるかどうか" do
      post users_path, params: { user: params }
      expect(response).to have_http_status(:success)
    end
  end
  


end
