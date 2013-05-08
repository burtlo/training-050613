require 'spec_helper'

describe SessionsController do

  before do
    Rails.application.routes.draw do
      resources :sessions, only: [ :create ]
      root to: "site#index"
    end
  end

  after do
    Rails.application.reload_routes!
  end

  describe '#create' do

    context "when authenticating with twitter" do
      let(:provider) { 'twitter' }
      let(:uid) { '81525784' }
      let(:name) { 'Alice Smith' }

      before do
        @request.env["omniauth.auth"] = {
          'provider' => provider,
          'uid' => uid,
          'info' => { 'name' => name } }
      end

      it "creates a user if one does not exist" do
        post :create
        user = User.find_by_uid_and_provider(uid,provider)
        expect(user.name).to eq name
      end

      it "does not create duplicate users" do
        User.create(provider: provider,uid: uid,name: name)
        post :create
        expect(User.count).to eq 1
      end

      it "logs in the user" do
        post :create
        user = User.find_by_uid_and_provider(uid,provider)
        current_user = controller.send(:current_user)
        expect(current_user.id).to eq user.id
      end

      it "redirects to the root path" do
        post :create
        expect(response).to redirect_to(root_path)
      end
    end


  end
end