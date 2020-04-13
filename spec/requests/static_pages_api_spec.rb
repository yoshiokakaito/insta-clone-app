require 'rails_helper'

RSpec.describe "StaticPages", type: :request do
  describe "#home" do
    before { get root_path }

    it "homeページへのレスポンスが成功するか" do
      expect(response).to be_success
    end
    
    it "タイトルが思い通りになっているか" do
      expect(response.body).to include "Instagram clone App"
    end
  end
    
  describe "#Log in" do
    before { get login_path }

    it "log inページへのレスポンスが成功するか" do
      expect(response).to be_success
    end
    
    it "タイトルが思い通りになっているか" do
      expect(response.body).to include "Log in | Instagram clone App"
    end
  end
  
  describe "#Sign up" do
    before { get signup_path }

    it "sign upページへのレスポンスが成功するか" do
      expect(response).to be_success
    end
    
    it "タイトルが思い通りになっているか" do
      expect(response.body).to include "Sign up | Instagram clone App"
    end
  end
end